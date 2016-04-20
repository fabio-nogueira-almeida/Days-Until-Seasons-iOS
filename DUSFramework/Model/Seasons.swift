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
    
    public let colors = [
        "Spring": UIColor(red:0.02, green:0.95, blue:0.49, alpha:1),
        "Summer": UIColor(red:0.94, green:0.22, blue:0.16, alpha:1),
        "Autumn": UIColor.brownColor(),
        "Winter": UIColor(red:0.1, green:0.57, blue:0.94, alpha:1),
    ]

    var currentHemisphereSeasons : NSArray = []
    
    public var isSouthernHemisphere: Bool = false {
        didSet {
            self.initialize()
        }
    }
    public var currentSeason: Season = Season()
    public var nextSeason : Season = Season()
    public var daysUntilNextSeason: Int = 0
    
    // MARK: Initialize Methods
    
    override public init() {
        super.init()
        self.initialize()
    }
    
    // MARK: Private Methods
    
    func initialize() {
        self.currentHemisphere()
        self.currentSeason = seasonForDate(NSDate())
        self.setNextSeasonOnSeasons(currentHemisphereSeasons)
        self.setDaysUntilNextSeason()
    }
    
    func currentHemisphere() {
        if (self.isSouthernHemisphere) {
            self.currentHemisphereSeasons = southernHemisphereSeasons()
        } else {
            currentHemisphereSeasons = northernHemisphereSeasons()
        }
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
    
    func southernHemisphereSeasons() -> NSArray {
        let startSummer = NSDate.date(21, month: 12, year: NSDate().year()-1)
        let endSummer = NSDate.dateFromActualYear(20, month: 3)
        self.summer = Season(
            seasonStartDate: startSummer,
            seasonEndDate: endSummer,
            seasonName: "Summer")
        
        let startAutumn = NSDate.dateFromActualYear(21, month: 3)
        let endAutumn = NSDate.dateFromActualYear(20, month: 6)
        self.autumn = Season(
            seasonStartDate: startAutumn,
            seasonEndDate: endAutumn,
            seasonName: "Autumn")
        
        let startWinter = NSDate.dateFromActualYear(21, month: 6)
        let endWinter = NSDate.dateFromActualYear(20, month: 9)
        self.winter = Season(
            seasonStartDate: startWinter,
            seasonEndDate: endWinter,
            seasonName: "Winter")
        
        let startSpring = NSDate.dateFromActualYear(21, month: 9)
        let endSpring = NSDate.dateFromActualYear(20, month: 12)
        self.spring = Season(
            seasonStartDate: startSpring,
            seasonEndDate: endSpring,
            seasonName: "Spring")
        return [self.summer, self.autumn, self.winter, self.spring]
    }
    
    func northernHemisphereSeasons() -> NSArray {
        let startWinter = NSDate.date(21, month: 12, year: NSDate().year()-1)
        let endWinter = NSDate.dateFromActualYear(20, month: 3)
        self.winter = Season(
            seasonStartDate: startWinter,
            seasonEndDate: endWinter,
            seasonName: "Winter")
        
        let startSpring = NSDate.dateFromActualYear(21, month: 3)
        let endSpring = NSDate.dateFromActualYear(20, month: 6)
        self.spring = Season(
            seasonStartDate: startSpring,
            seasonEndDate: endSpring,
            seasonName: "Spring")
        
        let startSummer = NSDate.dateFromActualYear(21, month: 6)
        let endSummer = NSDate.dateFromActualYear(20, month: 9)
        self.summer = Season(
            seasonStartDate: startSummer,
            seasonEndDate: endSummer,
            seasonName: "Summer")
        
        let startAutumn = NSDate.dateFromActualYear(21, month: 9)
        let endAutumn = NSDate.dateFromActualYear(20, month: 12)
        self.autumn = Season(
            seasonStartDate: startAutumn,
            seasonEndDate: endAutumn,
            seasonName: "Autumn")
        return [self.winter, self.spring, self.summer, self.autumn]
    }
    
    func setNextSeasonOnSeasons(seasons: NSArray) {
        let indexOfCurrentSeason = seasons.indexOfObject(self.currentSeason)
        let nextSeason = seasons.objectAtIndex(indexOfCurrentSeason + 1) as! Season
        self.nextSeason = nextSeason;
    }
    
    func setDaysUntilNextSeason() {
        self.daysUntilNextSeason = NSDate.numberOfDaysBetweenDates(NSDate(), toDate: self.nextSeason.startDate)
    }
}
