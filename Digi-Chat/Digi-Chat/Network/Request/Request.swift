//
//  Request.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation

// MARK: - RequestProtocol

protocol RequestProtocol {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
}

// MARK: - RequestProtocol Extension

extension RequestProtocol {
    var scheme: String {
        "https"
    }
    
    var headers: [String: String] {
        [:]
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var requestType: RequestType {
        .get
    }
    
    func createURLRequest() throws -> URLRequest {
        let contentValue = "application/json"
        let contentType = "Content-Type"
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        guard let url = components.url else {
            throw RequestError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        urlRequest.setValue(contentValue,
                            forHTTPHeaderField: contentType)
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}
