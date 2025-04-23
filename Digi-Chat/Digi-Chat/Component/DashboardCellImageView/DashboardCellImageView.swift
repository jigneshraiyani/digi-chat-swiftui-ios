//
//  DashboardCellImageView.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/29/24.
//

import SwiftUI

// MARK: - DashboardCellImageView

struct DashboardCellImageView: View {
    let imageName = "person.fill"
    var body: some View {
        ZStack {
            Image(systemName: imageName)
                .foregroundColor(Color.theme.accentColor)
        }
    }
}

struct DashboardCellImageView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCellImageView()
    }
}
