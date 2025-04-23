//
//  MockChatMessageService.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation
@testable import Digi_Chat

class MockChatMessageService: ChatMessageServiceProtocol {
    var shouldSucceed: Bool = false
        
    var mockMessages: [Message] {
        [
            Message(content: "Hello..mock!!", isCurrentUser: false)
        ]
    }
    
    func getChatMessage() async -> [Message] {
        var messages: [Message] = []
        if shouldSucceed {
            messages = mockMessages
        }
        return messages
    }
}
