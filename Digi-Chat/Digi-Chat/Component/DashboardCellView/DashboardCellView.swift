//
//  DashboardCellView.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import SwiftUI

// MARK: - DashboardCellView

struct DashboardCellView: View {
    let user: User
    
    // constant
    let cellDim = 50.0
    let cellZeroSpace = 0.0
    let cellOpacity = 0.001
    
    var body: some View {
        HStack(spacing: cellZeroSpace) {
            leftColumn
            centerColumn
        }
        .font(.subheadline)
        .background(
            Color.theme.backgroundColor.opacity(cellOpacity)
        )
    }
}

extension DashboardCellView {
    
    private var leftColumn: some View {
        VStack(spacing: cellZeroSpace){
            DashboardCellImageView()
                .frame(width: cellDim,
                       height: cellDim)
        }
    }
    
    private var centerColumn: some View {
        VStack (alignment: .leading){
            Text(user.name)
                .bold()
                .foregroundColor(Color.theme.accentColor)
            Text(user.detail)
                .foregroundColor(Color.theme.accentColor)
        }
    }
}

struct DashboardCellView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCellView(user: User(name: "test",
                                     detail: "test details"))
    }
}
