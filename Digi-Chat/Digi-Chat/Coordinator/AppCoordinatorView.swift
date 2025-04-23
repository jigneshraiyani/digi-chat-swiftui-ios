//
//  AppCoordinatorView.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import Foundation
import SwiftUI

// MARK: - AppCoordinatorView

struct AppCoordinatorView: View {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.buildView(page: .dashboardView)
                .navigationDestination(for: AppPages.self) { page in
                    appCoordinator.buildView(page: page)
                }
        }
        .environmentObject(appCoordinator)
    }
}
