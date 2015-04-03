//
//  File.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import Foundation

extension NSDate {
    
    class func dateFromActualYear(day: Int, month: Int) -> NSDate {   
        let dateForYear = NSDate()
        let components = NSCalendar.currentCalendar().components(.CalendarUnitYear, fromDate: dateForYear)
        let year = components.year
        
        var dateComponent = NSDateComponents()
        dateComponent.day = day;
        dateComponent.month = month;
        dateComponent.year = year;
        
        let dateWithActualYear = NSCalendar.currentCalendar().dateFromComponents(dateComponent);
        return dateWithActualYear!;
    }
}