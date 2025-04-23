//
//  UserModel.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation

// MARK: - User Model

struct UserModel: Codable {
    var id = UUID()
    var name: String
    var detail: String
}
