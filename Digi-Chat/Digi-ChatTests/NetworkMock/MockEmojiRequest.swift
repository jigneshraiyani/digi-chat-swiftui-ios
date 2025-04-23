//
//  MockRequest.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation
@testable import Digi_Chat

struct MockEmojiRequest: RequestProtocol {
    public var scheme: String { "https" }
    public var host: String { "emojihub.com" }
    public var path: String { "/comments-data" }
    
    var url: URL {
        try! createURLRequest().url!
    }
}
