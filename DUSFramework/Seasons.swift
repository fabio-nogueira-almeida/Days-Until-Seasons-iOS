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
        self.spring = Season()
        self.summer = Season()
        self.autumn = Season()
        self.winter = Season()
    }
    
    // MARK: Private Methods
    
    
    // MARK: Public Methods
}
