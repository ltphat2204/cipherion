import json
import os.path

from scipy.sparse import load_npz
from flask import Flask, request, abort, Response
import redis
import pickle
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)
r = redis.Redis(host=os.getenv("REDIS_HOST"), port=int(os.getenv("REDIS_PORT")), decode_responses=True)
@app.route('/song', methods=['GET'])
def send_recommendations():
    try:
        if request.args.get('userId') is not None and request.args.get('recommendationsNumber') is not None:
            if r.exists(request.args.get('userId')+"_user") == 0:
                print(request.args.get('userId')+"_user")
                return abort(404, "User not found")
            userId = int(r.get(request.args.get('userId')+"_user"))
            recommendationsNumber = int(request.args.get('recommendationsNumber'))
            result = make_recommendations(userId, recommendationsNumber, "song")
            if result == -1:
                raise ValueError
            elif result == -2:
                raise NotImplementedError
            else:
                return result
        else:
            raise ValueError
    except ValueError:
        abort(400, 'Bad Request\nCheck Parameters')
    except NotImplementedError:

        return Response(json.dumps({'err': 'Not enough data'}), status=501, mimetype='application/json')

@app.route('/artist', methods=['GET'])
def send_recommendations():
    try:
        if request.args.get('userId') is not None and request.args.get('recommendationsNumber') is not None:
            if r.exists(request.args.get('userId')+"_user") == 0:
                print(request.args.get('userId')+"_user")
                return abort(404, "User not found")
            userId = int(r.get(request.args.get('userId')+"_user"))
            recommendationsNumber = int(request.args.get('recommendationsNumber'))
            result = make_recommendations(userId, recommendationsNumber, "artist")
            if result == -1:
                raise ValueError
            elif result == -2:
                raise NotImplementedError
            else:
                return result
        else:
            raise ValueError
    except ValueError:
        abort(400, 'Bad Request\nCheck Parameters')
    except NotImplementedError:

        return Response(json.dumps({'err': 'Not enough data'}), status=501, mimetype='application/json')

# Recommend N items for the target user
def make_recommendations(target_user_id, n, type):
    # Load the stored user-item matrix
    if not os.path.exists(f"./model/sparse_user_{type}.npz") or not os.path.exists(f"./model/model_{type}.save"):
        return -2
    sparse_user_item = load_npz(f"sparse_user_{type}.npz")
    # Load the stored recommendations model
    with open(f'model_{type}.sav', 'rb') as pickle_in:
        model = pickle.load(pickle_in)
    try:
        # Make recommendations using the model
        recommended = model.recommend(target_user_id, sparse_user_item, n, filter_already_liked_items=False,)
    except IndexError:
        return -1
    recommended_items = []
    for item in recommended[0]:
        recommended_items.append(r.get(str(item)+"_song_code"))
    return {'user_id': target_user_id,
            'recommended_items': recommended_items}

if __name__ == '__main__':
    from waitress import serve

    serve(app, host="0.0.0.0", port=5000)