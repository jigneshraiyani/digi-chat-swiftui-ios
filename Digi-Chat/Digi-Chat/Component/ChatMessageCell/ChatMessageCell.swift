//
//  ChatMessageCell.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/1/24.
//

import SwiftUI

// MARK: - ChatMessageCell

struct ChatMessageCell: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    // Constant
    let padding = 10.0
    let radius = 10.0
    
    var body: some View {
        Text(contentMessage)
            .padding(padding)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor.systemGray6))
            .cornerRadius(radius)
    }
}

struct ChatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageCell(contentMessage: "This is message cell view.",
                        isCurrentUser: false)
    }
}
