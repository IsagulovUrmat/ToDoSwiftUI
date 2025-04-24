//
//  MainViewViewModel.swift
//  ToDoAppSwiftUI
//
//  Created by sunflow on 20/4/25.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var signedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
