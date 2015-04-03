//
//  File.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import Foundation

extension NSDate {
    
    func day() -> Int {
        let components = NSCalendar.currentCalendar().components(.CalendarUnitDay, fromDate: self)
        return components.day
    }
    
    func month() -> Int {
        let components = NSCalendar.currentCalendar().components(.CalendarUnitMonth, fromDate: self)
        return components.month
    }
    
    func year() -> Int {
        let components = NSCalendar.currentCalendar().components(.CalendarUnitYear, fromDate: self)
        return components.year
    }
 
    // MARK: Class/Static Methods
    
    class func dateFromActualYear(day: Int, month: Int) -> NSDate {
        var dateComponent = NSDateComponents()
        dateComponent.day = day
        dateComponent.month = month
        dateComponent.year = NSDate().year()
        
        let dateWithActualYear = NSCalendar.currentCalendar().dateFromComponents(dateComponent)
        return dateWithActualYear!
    }
    
}