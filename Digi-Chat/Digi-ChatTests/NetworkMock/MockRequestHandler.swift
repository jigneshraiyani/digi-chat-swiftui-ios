//
//  MockRequestHandler.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation
import Combine

@testable import Digi_Chat

// MARK: - MockRequestHandler

class MockRequestHandler: RequestHandlerProtocol {
    
    private let shouldSucceed: Bool
    let resourceName = "emoji"
    
    init(shouldSucceed: Bool = false) {
        self.shouldSucceed = shouldSucceed
    }
    
    func sendRequest(_ request: Digi_Chat.RequestProtocol) async throws -> Data {
        if shouldSucceed {
            return try! self.readBundleFile(forResource: resourceName)
        }
        throw RequestError.noData
    }
    
    func sendRequest(_ request: Digi_Chat.RequestProtocol) -> AnyPublisher<Data, Digi_Chat.RequestError> {
        if shouldSucceed {
            let data = try! self.readBundleFile(forResource: resourceName)
            return Just(data)
                .setFailureType(to: RequestError.self)
                .eraseToAnyPublisher()
            
        }
        return Fail(error: RequestError.noData)
            .eraseToAnyPublisher()
    }
}

extension MockRequestHandler {
    
    func readBundleFile(forResource: String) throws -> Data {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: forResource,
                                                                ofType: "json") else {
            throw RequestError.decode(description: "emoji.json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            throw RequestError.decode(description: "Unable to convert emoji.json to string")
        }
        
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw RequestError.decode(description: "Unable to convert emoji.json to data")
        }
        return jsonData
    }
}
