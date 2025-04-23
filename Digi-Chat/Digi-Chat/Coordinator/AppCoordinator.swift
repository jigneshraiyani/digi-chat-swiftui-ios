//
//  AppCoordinator.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import Foundation
import SwiftUI

// MARK: - AppCoordinator

class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func poptoRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func buildView(page: AppPages) -> some View {
        
        let requestHandler = RequestHandler()
        let responseHandler = ResponseHandler()
        let serviceManager = ServiceManager(requestHandler: requestHandler,
                                            responseHandler: responseHandler)
        switch page {
        case .dashboardView:
            let dashboardService = DashboardService(serviceManager: serviceManager)
            DashboardView(viewModel: DashboardViewModel(service: dashboardService))
        case .chatView(user: let user):
            let chatService = ChatMessageService(serviceManager: serviceManager)
            ChatView(viewModel: ChatViewModel(service: chatService),
                     user: user)
        }
    }
}
