//
//  RequestHandler.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation
import Combine

// MARK: - RequestHandlerProtocol

protocol RequestHandlerProtocol {
    func sendRequest(_ request: RequestProtocol) async throws -> Data
    func sendRequest(_ request: RequestProtocol) -> AnyPublisher<Data, RequestError>
}

// MARK: - RequestHandler

struct RequestHandler: RequestHandlerProtocol {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func sendRequest(_ request: RequestProtocol) async throws -> Data {
        let urlRequest = try request.createURLRequest()
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.failed(description: "Request Failed.")
        }
        switch response.statusCode {
        case 200...299:
            return data
        case 401:
            throw RequestError.unauthorized
        default:
            throw RequestError.unexpectedStatusCode(description:
                                                        "Status Code: \(response.statusCode)")
        }
    }
    
    func sendRequest(_ request: RequestProtocol) -> AnyPublisher<Data, RequestError> {
        guard let urlRequest = try? request.createURLRequest() else {
            return Fail(error: RequestError.invalidURL)
                .eraseToAnyPublisher()
        }
        return session
            .dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global())
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw RequestError.failed(description: "Request Failed.")
                }
                switch httpResponse.statusCode {
                case 200...299:
                    return data
                case 401:
                    throw RequestError.unauthorized
                default:
                    throw RequestError.unexpectedStatusCode(description:
                                                                "Status Code: \(httpResponse.statusCode)")
                }
            }
            .mapError { error -> RequestError in
                if let requestError = error as? RequestError {
                    return requestError
                }
                return RequestError.unknown
            }
            .eraseToAnyPublisher()
    }
}
