//
//  ServiceManagerTest.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import XCTest
import Combine
@testable import Digi_Chat

final class ServiceManagerTest: XCTestCase {
    
    var serviceManager: ServiceManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        serviceManager = nil
    }
    
    func testServiceManagerGetEmoji() async throws {
        let mockRequestHandler = MockRequestHandler(shouldSucceed: true)
        let mockResponseHandler = MockResponseHandler(shouldSucceed: true)
        serviceManager = ServiceManager(requestHandler: mockRequestHandler,
                                        responseHandler: mockResponseHandler)
        
        var emoji: EmojiModel
        let request = MockEmojiRequest()

        let expectation = XCTestExpectation(description: "Service Manager gets emoji")
        do {
            emoji = try await serviceManager.fetch(request: request)
            expectation.fulfill()

            // verify data correctness
            let emojiResponse = try XCTUnwrap(emoji)
            XCTAssert(emojiResponse.name == "test spoon")
            XCTAssert(emojiResponse.category == "food and drink")
            XCTAssert(emojiResponse.group == "dishware")
            XCTAssert(emojiResponse.htmlCode == ["123456"])
            XCTAssert(emojiResponse.unicode == ["112233"])
        }
        catch {
            print(error)
            XCTFail("Service Manager should complete fetch request.")
        }
    }
    
    func testServiceManagerThrowsError() async throws {
        
        let mockRequestHandler = MockRequestHandler(shouldSucceed: false)
        let mockResponseHandler = MockResponseHandler(shouldSucceed: false)
        serviceManager = ServiceManager(requestHandler: mockRequestHandler,
                                        responseHandler: mockResponseHandler)
        let request = MockEmojiRequest()
        
        let expectation = XCTestExpectation(description: "Service Manager throws error")
        do {
            let _: EmojiModel = try await serviceManager!.fetch(request: request)
            XCTFail("Expected Service Manager should throw error")
        }
        catch RequestError.noData {
            expectation.fulfill()
        }
    }
}
