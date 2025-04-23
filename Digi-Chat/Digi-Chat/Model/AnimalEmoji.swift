//
//  AnimalEmoji.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/7/24.
//import Foundation

// MARK: - AnimalEmoji

struct AnimalEmoji: Codable {
    let name: String
    let category: Category
    let group: Group
    let htmlCode, unicode: [String]
}

enum Category: String, Codable {
    case animalsAndNature = "animals and nature"
}

enum Group: String, Codable {
    case animalBird = "animal bird"
}
