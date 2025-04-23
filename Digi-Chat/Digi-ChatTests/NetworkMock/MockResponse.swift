//
//  MockResponse.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation

struct MockResponse {
    
    var emojiData: Data {
        let jsonString = """
                        {"name":"spoon with dish","category":"food and drink","group":"dishware","htmlCode":["001122"],"unicode":["1111"]}
                        """
        return jsonString.data(using: .utf8)!
    }
    
    var animalEmojiData: Data {
        let json = """
                    [{"name":"India","category":"animals and nature","group":"animal & bird","htmlCode":["000000"],"unicode":["1234"]},
                    {"name":"chicken","category":"animals and nature","group":"animal&bird","htmlCode":["123456"],"unicode":["4321"]}]
                    """
        return json.data(using: .utf8)!
    }
    
    var dummyData: Data {
        "text data".data(using: .utf8)!
    }
}
