import { Injectable } from '@angular/core';
import { Firestore, collection, query, where, collectionData, doc, updateDoc, deleteDoc } from '@angular/fire/firestore';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

export type Request = {
  id: string;
  artist: string;
  coverImage: string;
  url: string;
  genre: string;
  songName: string;
  user: string;
  time: number;
  isChecked: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class BusinessService {
  constructor(private firestore: Firestore) { }

  getRequests(): Observable<Request[]> {
    const requestsCollection = collection(this.firestore, 'uploads');
    const q = query(requestsCollection, where('isChecked', '==', false));

    return collectionData(q, { idField: 'id' }).pipe(
      map(requests => requests as Request[])
    );
  }

  acceptRequest(id: string): Promise<void> {
    const requestDoc = doc(this.firestore, 'uploads', id);
    return updateDoc(requestDoc, { isChecked: true });
  }

  rejectRequest(id: string): Promise<void> {
    const requestDoc = doc(this.firestore, 'uploads', id);
    return deleteDoc(requestDoc);
  }
}