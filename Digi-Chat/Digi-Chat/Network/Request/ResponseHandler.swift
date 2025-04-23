//
//  ResponseHandler.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation
import Combine

// MARK: - ResponseHandlerProtocol

protocol ResponseHandlerProtocol {
    func getResponse<T: Decodable>(from response: Data) throws -> T
}

// MARK: - ResponseHandler

struct ResponseHandler: ResponseHandlerProtocol {
    let decoder: JSONDecoder
    
    public init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    public func getResponse<T: Decodable>(from data: Data) throws -> T {
        do {
            let jsonString = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(" string = \(jsonString)")
            return try decoder.decode(T.self, from: data)
        } catch {
            throw RequestError.decode(description: error.localizedDescription)
        }
    }
}
