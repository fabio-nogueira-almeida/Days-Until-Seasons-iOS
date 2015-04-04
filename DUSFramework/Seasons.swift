//
//  Seasons.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit

@objc public class Seasons: NSObject {
    
    // MARK: Properties
    
    var spring : Season = Season()
    var summer : Season = Season()
    var autumn : Season = Season()
    var winter : Season = Season()

    var northernSeasons : NSArray = []
    var southernSeasons : NSArray = []
    
    public var currentSeason: Season = Season()
    public var nextSeason : Season = Season()
    public var daysUntilNextSeason: Int = 0
    
    // MARK: Initialize Methods
    
    override public init() {
        super.init()
//        northernSeasons = northernHemisphereSeasons()
        southernSeasons = southernHemisphereSeasons()
        
        self.currentSeason = seasonForDate(NSDate())
        self.setNextSeasonOnSeasons(self.southernSeasons)
        self.setDaysUntilNextSeason()
    }
    
    // MARK: Private Methods
    
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
    
    func southernHemisphereSeasons() -> NSArray {
        let startSummer = NSDate.date(21, month: 12, year: NSDate().year()-1)
        let endSummer = NSDate.dateFromActualYear(20, month: 3)
        self.summer = Season(
            seasonStartDate: startSummer,
            seasonEndDate: endSummer,
            seasonName: NSLocalizedString("Summer", value: "Summer", comment: ""))
        
        let startAutumn = NSDate.dateFromActualYear(21, month: 3)
        let endAutumn = NSDate.dateFromActualYear(20, month: 6)
        self.autumn = Season(
            seasonStartDate: startAutumn,
            seasonEndDate: endAutumn,
            seasonName: NSLocalizedString("Autumn", value: "Autumn", comment: ""))
        
        let startWinter = NSDate.dateFromActualYear(21, month: 6)
        let endWinter = NSDate.dateFromActualYear(20, month: 9)
        self.winter = Season(
            seasonStartDate: startWinter,
            seasonEndDate: endWinter,
            seasonName: NSLocalizedString("Winter", value: "Winter", comment: ""))
        
        let startSpring = NSDate.dateFromActualYear(21, month: 9)
        let endSpring = NSDate.dateFromActualYear(20, month: 12)
        self.spring = Season(
            seasonStartDate: startSpring,
            seasonEndDate: endSpring,
            seasonName: NSLocalizedString("Spring", value: "Spring", comment: ""))
        return [self.summer, self.autumn, self.winter, self.spring]
    }
    
    func northernHemisphereSeasons() -> NSArray {
        let startWinter = NSDate.date(21, month: 12, year: NSDate().year()-1)
        let endWinter = NSDate.dateFromActualYear(20, month: 3)
        self.winter = Season(
            seasonStartDate: startWinter,
            seasonEndDate: endWinter,
            seasonName: NSLocalizedString("Winter", value: "Winter", comment: ""))
        
        let startSpring = NSDate.dateFromActualYear(21, month: 3)
        let endSpring = NSDate.dateFromActualYear(20, month: 6)
        self.spring = Season(
            seasonStartDate: startSpring,
            seasonEndDate: endSpring,
            seasonName: NSLocalizedString("Spring", value: "Spring", comment: ""))
        
        let startSummer = NSDate.dateFromActualYear(21, month: 6)
        let endSummer = NSDate.dateFromActualYear(20, month: 9)
        self.summer = Season(
            seasonStartDate: startSummer,
            seasonEndDate: endSummer,
            seasonName: NSLocalizedString("Summer", value: "Summer", comment: ""))
        
        let startAutumn = NSDate.dateFromActualYear(21, month: 9)
        let endAutumn = NSDate.dateFromActualYear(20, month: 12)
        self.autumn = Season(
            seasonStartDate: startAutumn,
            seasonEndDate: endAutumn,
            seasonName: NSLocalizedString("Autumn", value: "Autumn", comment: ""))
        return [self.winter, self.spring, self.summer, self.autumn]
    }
    
    func setNextSeasonOnSeasons(seasons: NSArray) {
        let indexOfCurrentSeason = seasons.indexOfObject(self.currentSeason)
        let nextSeason = seasons.objectAtIndex(indexOfCurrentSeason + 1) as Season
        self.nextSeason = nextSeason;
    }
    
    func setDaysUntilNextSeason() {
        self.daysUntilNextSeason = NSDate.numberOfDaysBetweenDates(NSDate(), toDate: self.nextSeason.startDate)
    }
}
