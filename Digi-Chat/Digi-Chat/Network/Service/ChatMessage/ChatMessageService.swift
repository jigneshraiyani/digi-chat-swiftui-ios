//
//  ChatMessageService.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/3/24.
//

import Foundation
import Combine

// MARK: - ChatMessageServiceProtocol

protocol ChatMessageServiceProtocol {
    func getChatMessage() async -> [Message]
}

// MARK: - ChatMessageService

class ChatMessageService: ObservableObject, ChatMessageServiceProtocol {
    
    let serviceManager: ServiceManagerProtocol
    @Published var messages: [Message] = []
    
    init(serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    var mockMessages: [Message] {
        [
            Message(content: "Hello..!!", isCurrentUser: true),
            Message(content: "Hello! How can I help you", isCurrentUser: false),
            Message(content: "How are you doing?", isCurrentUser: true),
            Message(content: "I'm just a computer program, so I don't have feelings, but I'm here and ready to help you with any questions or tasks you have. How can I assist you today?", isCurrentUser: false),
            Message(content: "Tell me a joke.", isCurrentUser: true),
            Message(content: "Certainly! Here's one for you: Why don't scientists trust atoms? Because they make up everything!", isCurrentUser: false),
            Message(content: "How far away is the Moon from the Earth?", isCurrentUser: true),
            Message(content: "The average distance from the Moon to the Earth is about 238,855 miles (384,400 kilometers). This distance can vary slightly because the Moon follows an elliptical orbit around the Earth, but the figure I mentioned is the average distance.", isCurrentUser: false)
        ]
    }
    
    func getChatMessage() async -> [Message] {
        var messages: [Message] = []
        do {
            let request = AnimalEmojiRequest()
            let animalEmoji: [AnimalEmoji] = try await serviceManager.fetch(request: request)
            if animalEmoji.count > 0 {
                messages = mockMessages
            }
        } catch {
            print("error char service = \(error)" )
        }
        return messages
    }
}
