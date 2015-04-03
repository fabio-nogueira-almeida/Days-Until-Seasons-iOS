//
//  Seasons.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit

class Seasons: NSObject {
    
    // MARK: Properties
    
    var spring : Season
    var summer : Season
    var autumn : Season
    var winter : Season
    
    // MARK: Initialize Methods
    
    override init() {
        let startSpring = NSDate.dateFromActualYear(22, month: 9)
        let endSpring = NSDate.dateFromActualYear(21, month: 12)
        self.spring = Season(
            seasonStartDate: startSpring,
            seasonEndDate: endSpring,
            seasonName: NSLocalizedString("Spring", value: "Spring", comment: ""))
        
        let startSummer = NSDate.date(21, month: 12, year: NSDate().year()-1)
        let endSummer = NSDate.dateFromActualYear(20, month: 3)
        self.summer = Season(
            seasonStartDate: startSummer,
            seasonEndDate: endSummer,
            seasonName: NSLocalizedString("Summer", value: "Summer", comment: ""))
        
        let startAutumn = NSDate.dateFromActualYear(22, month: 3)
        let endAutumn = NSDate.dateFromActualYear(21, month: 6)
        self.autumn = Season(
            seasonStartDate: startAutumn,
            seasonEndDate: endAutumn,
            seasonName: NSLocalizedString("Autumn", value: "Autumn", comment: ""))
        
        let startWinter = NSDate.dateFromActualYear(22, month: 6)
        let endWinter = NSDate.dateFromActualYear(21, month: 9)
        self.winter = Season(
            seasonStartDate: startWinter,
            seasonEndDate: endWinter,
            seasonName: NSLocalizedString("Winter", value: "Winter", comment: ""))
    }
    
    // MARK: Private Methods
    
    func currentSeason() -> Season {
        return seasonForDate(NSDate())
    }
    
    func seasonForDate(date: NSDate) -> Season {
        var currentSeason = Season()
        
        if (date.IsBetween(self.spring.startDate, endDate: self.spring.endDate)) {
            currentSeason = self.spring
        } else if (date.IsBetween(self.summer.startDate, endDate: self.summer.endDate)) {
            currentSeason = self.summer
        } else if (date.IsBetween(self.autumn.startDate, endDate: self.autumn.endDate)) {
            currentSeason = self.autumn
        } else if (date.IsBetween(self.winter.startDate, endDate: self.winter.endDate)) {
            currentSeason = self.winter
        }
        
        return currentSeason
    }
}
