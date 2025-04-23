//
//  MockResponseHandler.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation
@testable import Digi_Chat

class MockResponseHandler: ResponseHandlerProtocol {
    private let shouldSucceed: Bool
    
    init(shouldSucceed: Bool = false) {
        self.shouldSucceed = shouldSucceed
    }
    
    func getResponse<T>(from response: Data) throws -> T where T : Decodable {
        if shouldSucceed {
          return try JSONDecoder().decode(T.self, from: response)
        } else {
            throw RequestError.decode(description: "No data")
        }
    }
}
