//
//  Message.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/24/24.
//

import Foundation

// MARK: - Message Model

struct Message: Hashable, Codable {
    var id = UUID()
    var content: String
    var isCurrentUser: Bool
}

