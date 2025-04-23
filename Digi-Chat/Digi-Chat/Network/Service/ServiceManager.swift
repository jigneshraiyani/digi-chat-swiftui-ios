//
//  ServiceManager.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation
import Combine

// MARK: - ServiceManagerProtocol

protocol ServiceManagerProtocol {
    func fetch<T: Decodable>(request: RequestProtocol) async throws -> T
    func fetch<T: Decodable>(request: RequestProtocol) -> AnyPublisher<T, RequestError>
}

// MARK: - ServiceManager

final class ServiceManager: ServiceManagerProtocol {
    var requestHandler: RequestHandlerProtocol
    var responseHandler: ResponseHandlerProtocol
    
    init(requestHandler: RequestHandlerProtocol = RequestHandler(),
         responseHandler: ResponseHandlerProtocol = ResponseHandler()) {
        self.requestHandler = requestHandler
        self.responseHandler = responseHandler
    }
    
    func fetch<T>(request: RequestProtocol) async throws -> T where T : Decodable {
        let data = try await requestHandler.sendRequest(request)
        return try responseHandler.getResponse(from: data)
    }
    
    func fetch<T>(request: RequestProtocol) -> AnyPublisher<T, RequestError> where T : Decodable {
        return requestHandler
            .sendRequest(request)
            .tryMap { data -> T in
                return try self.responseHandler.getResponse(from: data)
            }
            .mapError { error -> RequestError in
                return RequestError.decode(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
