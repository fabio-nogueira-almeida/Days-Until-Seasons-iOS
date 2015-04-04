//
//  GlanceController.swift
//   WatchKit Extension
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import WatchKit
import Foundation
import DUSFramework

class GlanceController: WKInterfaceController {
    
    @IBOutlet weak var daysLabel: WKInterfaceLabel!
    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var nextSeasonLabel: WKInterfaceLabel!

    override func willActivate() {
        addInformationToScreen()
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    // MARK: Private Methods
    
    func addInformationToScreen() {
        let seasons = Seasons()
        let daysUntil = NSLocalizedString("Days until", value: "Days until", comment: "")
        let days = seasons.daysUntilNextSeason
        let nextSeason = seasons.nextSeason.name
        
        self.daysLabel.setText("\(days)")
        self.descriptionLabel.setText(daysUntil)
        self.nextSeasonLabel.setText(nextSeason)
    }
}
