//
//  AppPages.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import Foundation

// MARK: - AppPages

enum AppPages: Hashable, Identifiable {
    
    case dashboardView
    case chatView(user: User)
    
    var id: String {
        switch self {
        case .dashboardView:
            return self.hashValue.description
        case .chatView(_):
            return self.hashValue.description
        }
    }
}
