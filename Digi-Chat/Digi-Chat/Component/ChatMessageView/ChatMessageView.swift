//
//  ChatMessageView.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/1/24.
//

import SwiftUI

// MARK: - ChatMessageView

struct ChatMessageView: View {
    var currentMessage: Message
    
    // Constant
    let height = 40.0
    let width = 40.0
    let radius = 20.0
    let image = "person.circle.fill"
    let space = 10.0
    
    var body: some View {
        HStack(alignment: .bottom,
               spacing: space) {
            if !currentMessage.isCurrentUser {
                Image(systemName: image)
                    .resizable()
                    .frame(width: width,
                           height: height,
                           alignment: .center)
                    .cornerRadius(radius)
            } else {
                Spacer()
            }
            ChatMessageCell(contentMessage: currentMessage.content,
                            isCurrentUser: currentMessage.isCurrentUser)
        }
               .frame(maxWidth: .infinity,
                      alignment: .leading)
               .padding()
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(currentMessage:
                            Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.",
                                    isCurrentUser: false)
        )
    }
}
