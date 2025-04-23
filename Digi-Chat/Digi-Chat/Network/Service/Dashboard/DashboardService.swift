//
//  DashboardService.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation

// MARK: - DashboardServiceProtocol

protocol DashboardServiceProtocol {
    func getUserDetails() async -> [User]
}

// MARK: - DashboardService

class DashboardService: ObservableObject, DashboardServiceProtocol  {
    
    let serviceManager: ServiceManagerProtocol
    @Published var users: [User] = []
    
    init(serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    var mockUser: [User] {
        [
            User(name: "User 11", detail: "Details 1"),
            User(name: "User 21", detail: "Details 2"),
            User(name: "User 31", detail: "Details 3"),
            User(name: "User 41", detail: "Details 4"),
            User(name: "User 51", detail: "Details 5"),
            User(name: "User 61", detail: "Details 6")
        ]
    }
    
    func getUserDetails() async -> [User] {
        var users: [User] = []
        do {
            let request = EmojiRequest()
            let emoji: Emoji = try await serviceManager.fetch(request: request)
            if !emoji.name.isEmpty {
                users = mockUser
            }
        } catch {
            print("error dashboard service = \(error)" )
        }
        return users
    }
}
