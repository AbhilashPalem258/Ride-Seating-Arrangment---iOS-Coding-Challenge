//
//  SampleTestingUnitTests.swift
//  SampleTestingUnitTests
//
//  Created by Kuliza on 12/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import XCTest
@testable import SampleTesting

class SampleTestingUnitTests: XCTestCase {
    
    var seatingArrangementObj: SeatingArrangement!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        seatingArrangementObj = SeatingArrangement.shared
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

//MARK: SampleTestingUnitTests - SeatingArrangement Test cases
extension SampleTestingUnitTests{
    func testPassengersCountMoreThanSeatingCapacity(){
        let tuple = SeatingArrangement.shared.getAllPositionArrays(SeatCapacityArr: SeatingArrangementContsnats.seatsCapacityArr)
        SeatingArrangement.shared.printSeatingPositionForPassengersCount(Count: 30, tuple: tuple)
        XCTAssert(seatingArrangementObj.seatingArrangementarr?.count == 30,"Passengers are more than seating capacity")
    }
    
    func testPassengersCountlessThanSeatingCapacity(){
        let tuple = SeatingArrangement.shared.getAllPositionArrays(SeatCapacityArr: SeatingArrangementContsnats.seatsCapacityArr)
        SeatingArrangement.shared.printSeatingPositionForPassengersCount(Count: 19, tuple: tuple)
        XCTAssert(seatingArrangementObj.seatingArrangementarr?.count == 19,"Passengers count is not matching with capacity array count")
    }
    
    func testAisleSeatsCountCapacity(){
         let tuple = SeatingArrangement.shared.getAllPositionArrays(SeatCapacityArr: SeatingArrangementContsnats.seatsCapacityArr)
        XCTAssert((tuple?.aislePositionArr.count)! > 0,"Aisle Seats Arr count is Zero")
        XCTAssert(tuple?.aislePositionArr.count == 11, "Aisle seats count should be equal to 11")
    }
    
    func testWindowSeatsCountCapacity(){
        let tuple = SeatingArrangement.shared.getAllPositionArrays(SeatCapacityArr: SeatingArrangementContsnats.seatsCapacityArr)
        XCTAssert((tuple?.WindowPositionArr.count)! > 0,"Window Seats Arr count is Zero")
        XCTAssert(tuple?.WindowPositionArr.count == 5, "Window seats count should be equal to 11")
    }
    
    func testMiddleSeatsCountCapacity(){
        let tuple = SeatingArrangement.shared.getAllPositionArrays(SeatCapacityArr: SeatingArrangementContsnats.seatsCapacityArr)
        XCTAssert((tuple?.MiddlePositionArr.count)! > 0,"Middle Seats Arr count is Zero")
        XCTAssert(tuple?.MiddlePositionArr.count == 8, "Middle seats count should be equal to 11")
    }
    
}
