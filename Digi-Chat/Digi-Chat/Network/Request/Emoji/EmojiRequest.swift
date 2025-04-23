//
//  EmojiRequest.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/6/24.
//

import Foundation

// MARK: - EmojiRequest

struct EmojiRequest: RequestProtocol {
    
    var scheme: String {
        "https"
    }
    var host: String {
        "emojihub.yurace.pro"
    }
    var path: String {
        "/api/random"
    }
    
    var url: URL {
        try! createURLRequest().url!
    }
}
