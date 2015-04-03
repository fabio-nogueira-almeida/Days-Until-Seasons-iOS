//
//  NSDateExtensionTests.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit
import XCTest

import DUSFramework

class NSDateExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShouldReturnDateWithYear2015() {
        let date = NSDate.dateFromActualYear(3, month: 7)

        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        XCTAssertEqual(dateFormatter.stringFromDate(date), "July 3, 2015", "testShouldReturnDateWithYear2015 July 3, 2015")
    }

    func testShouldNotReturnDateWithYear2014() {
        let date = NSDate.dateFromActualYear(12, month: 9)
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        XCTAssertNotEqual(dateFormatter.stringFromDate(date), "December 9, 2014", "testShouldNotReturnDateWithYear2014 December 9, 2019")
    }
    
    func testShouldReturnTheDayFromDate() {
        let date = NSDate.dateFromActualYear(5, month: 9)
        XCTAssertEqual(date.day(), 5, "testShouldReturnTheDayFromDate day 05")
    }
    
    func testShouldReturnTheMonthFromDate() {
        let date = NSDate.dateFromActualYear(5, month: 9)
        XCTAssertEqual(date.month(), 9, "testShouldReturnTheDayFromDate month 09")
    }
    
    func testShouldReturnTheYearFromDate() {
        let date = NSDate.dateFromActualYear(5, month: 9)
        XCTAssertEqual(date.year(), 2015, "testShouldReturnTheDayFromDate year 2015")
    }
    
}
