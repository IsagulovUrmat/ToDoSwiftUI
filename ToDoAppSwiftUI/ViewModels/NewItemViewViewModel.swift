//
//  NewItemViewViewModel.swift
//  ToDoAppSwiftUI
//
//  Created by sunflow on 20/4/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else { return }
        
        // Get current user ID
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // Create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false}
        
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
        
        return true
    }
}
