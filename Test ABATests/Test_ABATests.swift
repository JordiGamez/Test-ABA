//
//  Test_ABATests.swift
//  Test ABATests
//
//  Created by Jordi Gamez on 26/2/17.
//  Copyright © 2017 Jordi Gamez. All rights reserved.
//

import XCTest
@testable import Test_ABA

class Test_ABATests: XCTestCase {
    
    var row: Row!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        row = Row(title: "title", description: "description", image: "image.jpg")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCellTitle() {
        XCTAssertEqual(row.title, "title")
    }
    
    func testCellDescription() {
        XCTAssertEqual(row.description, "description")
    }
    
    func testCellImage() {
        XCTAssertEqual(row.image, "image.jpg")
    }
}
