//
//  RequestError.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation

// MARK: - RequestError

enum RequestError: Error {
    case invalidURL
    case failed(description: String)
    case noData
    case decode(description: String)
    case unauthorized
    case unexpectedStatusCode(description: String)
    case unknown
    
    var customDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No Data Found"
        case .failed(let description):
            return "Request Failed: \(description)"
        case .decode(let description):
            return "Decoding Error: \(description)"
        case .unauthorized:
            return "Session Expired"
        case .unexpectedStatusCode(let description):
            return "Unknown Error: \(description)"
        default:
            return "Unknown Error"
        }
    }
}

