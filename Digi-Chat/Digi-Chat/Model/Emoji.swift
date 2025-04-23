//
//  Emoji.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation

// MARK: - Emoji Model

struct Emoji: Codable {
    let name, category, group: String
    let htmlCode, unicode: [String]
}
