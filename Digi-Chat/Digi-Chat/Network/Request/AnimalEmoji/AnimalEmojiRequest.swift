//
//  AnimalEmojiRequest.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 12/7/24.
//

import Foundation

// MARK: - AnimalEmojiRequest

struct AnimalEmojiRequest: RequestProtocol {
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "emojihub.yurace.pro"
    }
    
    var path: String {
        "/api/all/group/animal-bird"
    }
    
    var url: URL {
        try! createURLRequest().url!
    }
}
