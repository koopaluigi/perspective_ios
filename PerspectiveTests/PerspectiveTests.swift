//
//  PerspectiveTests.swift
//  PerspectiveTests
//
//  Created by Cooper Luetje on 10/18/16.
//  Copyright © 2016 Cooper Luetje. All rights reserved.
//

import XCTest
@testable import Perspective

class PerspectiveTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginSuccess()
    {
        let sessionService = SessionService()
        
        let user = sessionService.login(username: "koopaluigi", password: "toadstool")
        
        XCTAssertFalse(user.id == -1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
