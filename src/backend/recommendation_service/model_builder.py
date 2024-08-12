import os

from scipy.sparse import save_npz
from kafka_connect import connect_kafka_consumer
import threading
import scipy.sparse as sparse
import pandas as pd
import implicit
import pickle
import queue
import argparse
import json
import redis
import time
import random
from dotenv import load_dotenv
# Create and store an BPR recommendations model

load_dotenv()
def create_recommendations_model(users_column, item_column, interactions_column, type):
    # The implicit library expects data as a item-user matrix
    # Create one matrix for fitting the model (item-user)
    print("Creating recommendations model")
    sparse_item_user = sparse.csr_matrix((interactions_column.astype(float), (item_column, users_column)))

    # Transposing the item-user matrix to create a matrix for recommendations (user-item)
    sparse_user_item = sparse_item_user.T.tocsr()

    # Save the user-item matrix for making recommendations asynchronously
    save_npz(f"./model/sparse_user_{type}.npz", sparse_user_item)

    # Initialize the als model
    model = implicit.bpr.BayesianPersonalizedRanking()

    # Calculate the confidence by multiplying it by our alpha value.
    alpha_val = 10
    data_conf = (sparse_user_item * alpha_val).astype('double')

    # Fit the model
    model.fit(data_conf)
    # Serialize and save the model
    with open(f'./model/model_{type}.sav', 'wb') as pickle_out:
        pickle.dump(model, pickle_out)


if __name__ == '__main__':
    # Defining program arguments
    # arg_parser = argparse.ArgumentParser(description='Continuously builds an BPR model for generating recommendations, '
    #                                                  'using a data stream of user-item interactions from a Kafka '
    #                                                  'topic')
    # arg_parser.add_argument('interactions_topic', type=str, help='the kafka topic with user-item interactions')
    # arg_parser.add_argument('retrain_frequency', type=int, help='the number of the received messages after '
    #                                                             'which the model will be re-trained')
    # arg_parser.add_argument('window_length', type=int, help='the number of the latest received messages that '
    #                                                         'will be used to train the model')
    # arg_parser.add_argument('-b', '--from-beginning', action='store_true', help='start with getting all messages '
    #                                                                             'stored in the topic from the beginning')
    # # Parsing the given arguments
    # args = arg_parser.parse_args()
    # interactions_topic = args.interactions_topic
    # freq = args.retrain_frequency
    # window_length = args.window_length

    # if args.from_beginning:
    #     consumer = connect_kafka_consumer(interactions_topic, 'earliest')
    # else:
    #     consumer = connect_kafka_consumer(interactions_topic, 'latest')

    interactions_topic = "recommend"
    freq = 5
    window_length = 100
    consumer = connect_kafka_consumer(interactions_topic, 'earliest')
    msg_count = 1
    init = True
    q = queue.Queue(maxsize=window_length)  # A FIFO queue
    user_list = []
    song_list = []
    artist_list = []
    r = redis.Redis(host=os.getenv("REDIS_HOST"), port=int(os.getenv("REDIS_PORT")), decode_responses=True)
    print(window_length)
    print(freq)
    while True:

        time.sleep(1)
        # Keep getting new interactions from kafka topic from the beginning
        for msg in consumer:
            # Replace oldest event with the latest if 'window_length' limit has been reached
            if q.full():
                q.get()
                q.put(msg)
            else:
                q.put(msg)
            # Retrain model every 'freq' events with the last 'window_length' events
            if msg_count == freq:
                counts_song = dict()
                counts_artist = dict()
                users = []
                songs = []
                artists = []
                interactions_song = []
                interactions_artist = []
                # Get the last 'window_length' events
                for lmsg in q.queue:

                    lmsg = str(lmsg.value)[2:].replace("'", "")
                    data = json.loads(lmsg)
                    lmsg_song = data["user_id"]+":"+data["song_id"]
                    # Count the occurrences of each interaction
                    if lmsg_song in counts_song:
                        counts_song[lmsg_song] += 1
                    else:
                        counts_song[lmsg_song] = 1
                    lmsg_artist = data["user_id"] + ":" + data["artist"]
                    # Count the occurrences of each interaction
                    if lmsg_artist in counts_artist:
                        counts_artist[lmsg_artist] += 1
                    else:
                        counts_artist[lmsg_artist] = 1
                    userId = 0
                    songId = 0
                    artistId = 0
                    if r.exists(data["user_id"]+"_user") > 0:
                        userId = int(r.get(data["user_id"]+"_user"))
                    else:
                        if len(user_list) == 0:
                            new_id = random.randint(0, 1000)
                        else:
                            new_id = user_list[0]
                            while new_id in user_list:
                                new_id = random.randint(0, 1000)
                        userId = new_id
                        user_list.append(new_id)
                        r.set(data["user_id"]+"_user", new_id)
                        r.set(str(new_id)+"_user_code", data["user_id"])
                    if r.exists(data["song_id"]+"_song") > 0:
                        songId = int(r.get(data["song_id"]+"_song"))
                    else:
                        if len(song_list) == 0:
                            new_id = random.randint(0, 1000)
                        else:
                            new_id = song_list[0]
                            while new_id in song_list:
                                new_id = random.randint(0, 1000)
                        songId = new_id
                        song_list.append(new_id)
                        r.set(data["song_id"]+"_song", new_id)
                        r.set(str(new_id)+"_song_code", data["song_id"])
                    if r.exists(data["artist"]+"_artist") > 0:
                        artistId = int(r.get(data["artist"]+"_artist"))
                    else:
                        if len(user_list) == 0:
                            new_id = random.randint(0, 1000)
                        else:
                            new_id = user_list[0]
                            while new_id in user_list:
                                new_id = random.randint(0, 1000)
                        artistId = new_id
                        user_list.append(new_id)
                        r.set(data["artist"]+"_artist", new_id)
                        r.set(str(new_id)+"_artist_code", data["artist"])
                    users.append(userId)
                    songs.append(songId)
                    artists.append(artistId)
                    interactions_song.append(counts_song[lmsg_song])
                    interactions_artist.append(counts_artist[lmsg_artist])
                # Data to pandas dataframe
                df_song = pd.DataFrame(list(zip(users, songs, interactions_song)), columns=['User', 'Item', 'Interaction'])
                df_artist = pd.DataFrame(list(zip(users, artists, interactions_artist)),
                                       columns=['User', 'Item', 'Interaction'])
                print(df_song)
                # and if there is no active thread for training
                if init or not t1.is_alive():
                    # Sparse matrix columns
                    users_col = df_song['User']
                    songs_col = df_song['Item']
                    interactions_col = df_song['Interaction']
                    print(len(df_song))

                    # Retrain the user-song model on a different thread
                    t1 = threading.Thread(target=create_recommendations_model,
                                          args=(users_col, songs_col, interactions_col, "song"))
                    users_col = df_artist['User']
                    songs_col = df_artist['Item']
                    interactions_col = df_artist['Interaction']
                    print(len(df_artist))

                    # Retrain the user-artist model on a different thread
                    t2 = threading.Thread(target=create_recommendations_model,
                                          args=(users_col, songs_col, interactions_col, "artist"))
                    t1.start()
                    t2.start()
                    init = False
                msg_count = 0

            msg_count += 1

    consumer.close()
