//
//  ChatViewModelTest.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import XCTest
@testable import Digi_Chat

final class ChatViewModelTest: XCTestCase {
    
    var chatViewModel: ChatViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptyMessageDetails() {
        
        let mockChatMessageService = MockChatMessageService()
        chatViewModel = ChatViewModel(service: mockChatMessageService)
        
        XCTAssertTrue(chatViewModel.messages.isEmpty)
    }
}
