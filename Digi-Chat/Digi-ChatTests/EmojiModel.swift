//
//  EmojiModel.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation

// MARK: - Emoji Model

struct EmojiModel: Codable {
    let name, category, group: String
    let htmlCode, unicode: [String]
}
