//
//  ChatViewModel.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/1/24.
//

import Foundation
import SwiftUI
import Combine

// MARK: - ChatViewModel

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    var service: ChatMessageServiceProtocol
    @Published var newMessage: String = ""
    
    private var cancellables =  Set<AnyCancellable>()
    let replyText = "Reply of "
    
    init(service: ChatMessageServiceProtocol) {
        self.service = service
        self.fetchMessageData()
    }
    
    func fetchMessageData()  {
        Task {
            let result: [Message] = await self.service.getChatMessage()
            await MainActor.run {
                self.messages = result
            }
        }
    }
    
    func sendMessage() {
        if newMessage.isEmpty != true {
            messages.append(Message(content: newMessage,
                                    isCurrentUser: true))
            messages.append(Message(content:  replyText + newMessage ,
                                    isCurrentUser: false))
            newMessage = ""
        }
    }
}
