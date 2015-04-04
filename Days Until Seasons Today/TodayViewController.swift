//
//  TodayViewController.swift
//  Days Until Seasons Today
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit
import NotificationCenter
import DUSFramework

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var currentSeasonImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(320, 60);
        
        addInformationToScreen(Seasons.currentSeason())
    }
    
    // MARK: Private Methods
    
    func addInformationToScreen(aseason: Season) {
        var descriptionText = "245 days until \(aseason.name)"
        self.descriptionLabel.text = descriptionText;
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets{
        return UIEdgeInsetsZero;
    }
    
}
