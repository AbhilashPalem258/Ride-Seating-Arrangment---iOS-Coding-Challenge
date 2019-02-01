//
//  SampleTestingUITests.swift
//  SampleTestingUITests
//
//  Created by Kuliza on 12/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import KIF

class SampleTestingUITests: KIFTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        tester().tapView(withAccessibilityLabel: "hello")
    }

}
