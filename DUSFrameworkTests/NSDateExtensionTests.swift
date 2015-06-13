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
        
        XCTAssertEqual(dateFormatter.stringFromDate(date), "3 de julho de 2015", "testShouldReturnDateWithYear2015 July 3, 2015")
    }

    func testShouldNotReturnDateWithYear2014() {
        let date = NSDate.dateFromActualYear(12, month: 9)
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        XCTAssertNotEqual(dateFormatter.stringFromDate(date), "December 9, 2014", "Date = December 9, 2019")
    }
    
    func testShouldReturnTheDayFromDate() {
        let date = NSDate.dateFromActualYear(5, month: 9)
        XCTAssertEqual(date.day(), 5, "Day = 05")
    }
    
    func testShouldReturnTheMonthFromDate() {
        let date = NSDate.dateFromActualYear(5, month: 9)
        XCTAssertEqual(date.month(), 9, "Month = 09")
    }
    
    func testShouldReturnTheYearFromDate() {
        let date = NSDate.dateFromActualYear(5, month: 9)
        XCTAssertEqual(date.year(), 2015, "Year = 2015")
    }
    
    func testShouldReturnTrueForDateBetweenDates() {
        let startDate = NSDate.dateFromActualYear(1, month: 01)
        let endDate = NSDate.dateFromActualYear(30, month: 01)
        let date = NSDate.dateFromActualYear(15, month: 01)

        XCTAssertTrue(date.IsBetween(startDate, endDate: endDate), "True")
    }
    
    func testShouldReturnFalseForDateBetweenDates() {
        let startDate = NSDate.dateFromActualYear(01, month: 01)
        let endDate = NSDate.dateFromActualYear(30, month: 01)
        
        let date = NSDate.dateFromActualYear(15, month: 09)
        
        XCTAssertFalse(date.IsBetween(startDate, endDate: endDate), "False")
    }
    
}
