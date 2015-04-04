//
//  InterfaceController.swift
//   WatchKit Extension
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import WatchKit
import Foundation
import DUSFramework


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var currentSeasonImageView: WKInterfaceImage!
    @IBOutlet weak var daysLabel: WKInterfaceLabel!
    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var nextSeasonLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        addInformationToScreen(Seasons.currentSeason())
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Private Methods
    
    func addInformationToScreen(season: Season) {
        let seasonName = NSLocalizedString(season.name, value: season.name, comment: "")
        let daysUntil = NSLocalizedString("Days until", value: "Days until", comment: "")
        let days = "164"
        let nextSeason = "Summer"
        
        self.currentSeasonImageView.setImage(UIImage(named: "\(seasonName)_Watch"))
        self.daysLabel.setText(days)
        self.descriptionLabel.setText(daysUntil)
        self.nextSeasonLabel.setText(nextSeason)
    }

}
