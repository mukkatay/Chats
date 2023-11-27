//
//  FCollectionReference.swift
//  Chats
//
//  Created by Akyl Mukatay  on 27.11.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreInternal

enum FCollectionReference: String {
    case User
    case Recent
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
