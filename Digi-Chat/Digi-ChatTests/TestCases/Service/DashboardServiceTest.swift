//
//  DashboardServiceTest.swift
//  Digi-ChatTests
//
//  Created by Raiyani Jignesh on 12/8/24.
//

import XCTest
@testable import Digi_Chat

final class DashboardServiceTest: XCTestCase {
    
    var dashboardService: DashboardService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dashboardService = nil
    }
    
    func testDashboardServiceUserDetails() async throws {
        
        let mockServiceManager = MockServiceManager(shouldSucceed: true)
        dashboardService = DashboardService(serviceManager: mockServiceManager)
        
        let expectation = XCTestExpectation(description: "Dashboard Service Manager gets users")
        let users: [User] = await dashboardService.getUserDetails()
        expectation.fulfill()
        
        // verify data correctness
        let userDetails = try XCTUnwrap(users.first)
        XCTAssert(userDetails.name == "User 11")
        XCTAssert(userDetails.detail == "Details 1")
        
    }
}
