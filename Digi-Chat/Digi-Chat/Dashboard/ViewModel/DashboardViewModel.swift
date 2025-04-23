//
//  DashboardViewModel.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import Foundation
import SwiftUI
import Combine

// MARK: - DashboardViewModel

class DashboardViewModel: ObservableObject {
    @Published var users: [User] = []
    var service: DashboardServiceProtocol
    private var cancellables =  Set<AnyCancellable>()
    
    init(service: DashboardServiceProtocol) {
        self.service = service
        self.fetchUserData()
    }
    
    func fetchUserData()  {
        Task {
            let result: [User] = await self.service.getUserDetails()
            await MainActor.run {
                self.users = result
            }
        }
    }
    
}
