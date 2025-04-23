//
//  MockURLProtocol.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import Foundation

class MockURLProtocol: URLProtocol {
    public static var error: Error?
    public static var requestHandler: ((URLRequest) throws -> (Data, HTTPURLResponse))?
    
    public override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    public override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    public override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Handler is unavailable.")
        }
        
        do {
            let (data, response) = try handler(request)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocolDidFinishLoading(self)
            
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    public override func stopLoading() {
    }
}
