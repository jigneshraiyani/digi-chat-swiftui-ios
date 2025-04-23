//
//  User.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import Foundation

// MARK: - User Model

struct User: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var detail: String
}
