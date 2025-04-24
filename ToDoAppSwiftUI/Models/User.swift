//
//  User.swift
//  ToDoAppSwiftUI
//
//  Created by sunflow on 25/4/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
