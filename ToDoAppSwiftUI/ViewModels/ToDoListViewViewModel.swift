//
//  ToDoListViewViewModel.swift
//  ToDoAppSwiftUI
//
//  Created by sunflow on 20/4/25.
//

import Foundation

/// ViewModel for list of items view
/// Primary tab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    init() {}
}
