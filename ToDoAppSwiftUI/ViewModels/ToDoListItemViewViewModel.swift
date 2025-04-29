//
//  ToDoListItemViewViewModel.swift
//  ToDoAppSwiftUI
//
//  Created by sunflow on 20/4/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item view ( each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
        
    }
}
