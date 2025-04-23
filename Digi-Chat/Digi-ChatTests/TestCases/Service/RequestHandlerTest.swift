//
//  RequestHandlerTest.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import XCTest
@testable import Digi_Chat

final class RequestHandlerTest: XCTestCase {
    
    var requestHandler: RequestHandler!
    var request: MockEmojiRequest!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        requestHandler = RequestHandler(session: URLSession.mock)
        request = MockEmojiRequest()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        requestHandler = nil
        request = nil
    }
    
    func testRequestHandlerReturnsData() async throws {
        MockURLProtocol.requestHandler = { request in
            guard request.url == self.request.url else {
                throw RequestError.invalidURL
            }
            
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            let mockResponse = MockResponse()
            let data = mockResponse.emojiData
            return (data, response)
        }
        
        let result = try await requestHandler!.sendRequest(request)
        let resultData = try XCTUnwrap(result)
        
        // verify data exists
        XCTAssertTrue(!resultData.isEmpty)
        
        // verify data correctness
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: result) as? [String: Any])
        
        let name = try XCTUnwrap(json["name"] as? String)
        XCTAssertEqual(name, "spoon with dish")
        
        let category = try XCTUnwrap(json["category"] as? String)
        XCTAssertEqual(category, "food and drink")
        
        let group = try XCTUnwrap(json["group"] as? String)
        XCTAssertEqual(group, "dishware")
    }
    
    func testRequestHandlerThrowsUnAuthorizedError() async throws {
        MockURLProtocol.requestHandler = { request in
            guard request.url == self.request.url else {
                throw RequestError.invalidURL
            }
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 401,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (Data(), response)
        }
        
        let expectation = XCTestExpectation(description: "RequestHandler throws UnAuthorized error")
        do {
            let _ = try await requestHandler!.sendRequest(request)
            XCTFail("RequestHandler should throw unAuthorized error")
        }
        catch RequestError.unauthorized {
            expectation.fulfill()
        }
    }
    
    func testRequestHandlerThrowsUnExpectedError() async throws {
        MockURLProtocol.requestHandler = { request in
            guard request.url == self.request.url else {
                throw RequestError.invalidURL
            }
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 500,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (Data(), response)
        }
        
        let expectation = XCTestExpectation(description: "RequestHandler throws Unexpected error")
        do {
            let _ = try await requestHandler!.sendRequest(request)
            XCTFail("RequestHandler should throw unexpectedStatusCode error")
        }
        catch RequestError.unexpectedStatusCode {
            expectation.fulfill()
        }
    }
}
