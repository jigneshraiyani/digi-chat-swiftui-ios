//
//  URLSession.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation

extension URLSession {
    
    static var mock: URLSession {
        let configuration: URLSessionConfiguration = .ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
}
