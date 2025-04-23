//
//  DashboardView.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import SwiftUI

// MARK: - DashboardView

struct DashboardView: View {
    
    @StateObject var viewModel: DashboardViewModel
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    // constant
    let title = "Digi Chat"
    let listMSpace = 10.0
    let listZeroSpace = 0.0
    
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea(.all)
            userList
                .navigationTitle(title)
        }
    }
    
    private var userList: some View {
        List {
            ForEach(viewModel.users) { user in
                DashboardCellView(user: user)
                    .listRowInsets(.init(top: listMSpace,
                                         leading: listZeroSpace,
                                         bottom: listZeroSpace,
                                         trailing: listMSpace))
                    .onTapGesture {
                        appCoordinator.push(page: .chatView(user: user))
                    }
                    .listRowBackground(Color.theme.backgroundColor)
            }
        }
        .listStyle(.plain)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let requestHandler = RequestHandler()
        let responseHandler = ResponseHandler()
        let serviceManager = ServiceManager(requestHandler: requestHandler,
                                            responseHandler: responseHandler)
        let dashboardService = DashboardService(serviceManager: serviceManager)
        DashboardView(viewModel: .init(service: dashboardService))
    }
}
