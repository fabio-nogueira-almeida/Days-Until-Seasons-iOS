//
//  SeasonsTest.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit
import XCTest

class SeasonsTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShouldReturnAutumnSeason() {
        let autumn = Seasons().seasonForDate(NSDate.dateFromActualYear(3, month: 4))
        XCTAssertEqual(autumn.name, Seasons().autumn.name, "Autumn Season")
    }
    
    func testShouldReturnSpringSeason() {
        let spring = Seasons().seasonForDate(NSDate.dateFromActualYear(23, month: 9))
        XCTAssertEqual(spring.name, Seasons().spring.name, "Spring Season")
    }
    
    func testShouldReturnSummerSeason() {
        let summer = Seasons().seasonForDate(NSDate.dateFromActualYear(28, month: 1))
        XCTAssertEqual(summer.name, Seasons().summer.name, "Summer Season")
    }
    
    func testShouldReturnWinterSeason() {
        let winter = Seasons().seasonForDate(NSDate.dateFromActualYear(23, month: 7))
        XCTAssertEqual(winter.name, Seasons().winter.name, "Winter Season")
    }
}
