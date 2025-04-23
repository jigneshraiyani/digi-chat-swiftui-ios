//
//  ResponseHandlerTests.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import XCTest
@testable import Digi_Chat

final class ResponseHandlerTests: XCTestCase {
    var responseHandler: ResponseHandler!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        responseHandler = ResponseHandler()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        responseHandler = nil
    }
    
    func testResponseHandlerParseSuccess() throws {
        let mockResponse = MockResponse()
        let data = mockResponse.emojiData
        
        let emojiModel: EmojiModel = try responseHandler!.getResponse(from: data)
        XCTAssertEqual(emojiModel.name, "spoon with dish")
        XCTAssertEqual(emojiModel.category, "food and drink")
        XCTAssertEqual(emojiModel.group, "dishware")
        XCTAssertEqual(emojiModel.htmlCode, ["001122"])
        XCTAssertEqual(emojiModel.unicode, ["1111"])
    }
    
    func testResponseHandlerParseFailure() throws {
        let dummyData = MockResponse().dummyData
        let expectation = XCTestExpectation(description: "ResponseHandler throws decode error")
        
        do {
            let _: EmojiModel = try responseHandler!.getResponse(from: dummyData)
            XCTFail("APIResponseHandler should throw decode error")
        }
        catch RequestError.decode {
            expectation.fulfill()
        }
    }
}
