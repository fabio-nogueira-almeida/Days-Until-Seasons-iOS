//
//  Season.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 03/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit

class Season: NSObject {
   
    // MARK: Properties
    
    var startDate : NSDate
    var endDate : NSDate
    var name : NSString = ""
 
    // MARK: Initialize Methods
    
    override init() {
        startDate = NSDate()
        endDate = NSDate()
    }
    
    init(seasonStartDate: NSDate, seasonEndDate: NSDate, seasonName: NSString) {
        self.startDate = seasonStartDate
        self.endDate = seasonEndDate
        name = seasonName
    }
    
}
