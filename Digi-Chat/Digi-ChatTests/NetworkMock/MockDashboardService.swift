//
//  MockDashboardService.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation
@testable import Digi_Chat

class MockDashboardService: DashboardServiceProtocol {
    private let shouldSucceed: Bool
    
    init(shouldSucceed: Bool = false) {
        self.shouldSucceed = shouldSucceed
    }
    
    var mockUser: [User] {
        [
            User(name: "User test", detail: "Detail test")
        ]
    }
    
    func getUserDetails() async -> [User] {
        var users: [User] = []
        users = mockUser
        return users
    }
}
