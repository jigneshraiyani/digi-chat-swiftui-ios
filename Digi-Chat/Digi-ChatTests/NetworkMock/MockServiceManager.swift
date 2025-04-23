//
//  MockServiceManager.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation
import Combine
@testable import Digi_Chat

class MockServiceManager: ServiceManagerProtocol {
    private let shouldSucceed: Bool
    
    init(shouldSucceed: Bool = false) {
        self.shouldSucceed = shouldSucceed
    }
    
    var mockEmoji: Emoji {
        Emoji(name: "test emoji", category: "test category", group: "test group", htmlCode: ["1212"], unicode: ["2222"])
    }
    
    var mockAnimalEmoji: [AnimalEmoji] {
        [AnimalEmoji(name: "test emoji", category:Category.animalsAndNature, group: Group.animalBird, htmlCode: ["1212"], unicode: ["2222"])]
    }
    
    func fetch<T>(request: RequestProtocol) async throws -> T where T : Decodable {
        if shouldSucceed {
            return mockEmoji as! T
        } else {
            return mockAnimalEmoji as! T
        }
        throw RequestError.unknown
    }
    
    func fetch<T>(request: Digi_Chat.RequestProtocol) -> AnyPublisher<T, Digi_Chat.RequestError> where T : Decodable {
        let mockRequestHandler = MockRequestHandler(shouldSucceed: true)
        let mockResponseHandler = MockResponseHandler(shouldSucceed: true)
        let mockRequest = MockEmojiRequest()
        return mockRequestHandler
            .sendRequest(mockRequest)
            .tryMap { data -> T in
                return try mockResponseHandler.getResponse(from: data)
            }
            .mapError { error -> RequestError in
                return RequestError.decode(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
