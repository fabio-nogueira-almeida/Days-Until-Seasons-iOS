//
//  InterfaceController.swift
//  Days Until Seasons Watch Extension
//
//  Created by Fabio Nogueira on 19/04/16.
//  Copyright © 2016 Fábio Nogueira de Almeida. All rights reserved.
//

import WatchKit
import Foundation
import DUSFrameworkWatchKit

class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    
    @IBOutlet weak var currentSeasonImageView: WKInterfaceImage!
    @IBOutlet weak var daysLabel: WKInterfaceLabel!
    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var nextSeasonLabel: WKInterfaceLabel!
    
    var seasons: Seasons = Seasons ()
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func awakeWithContext(context: AnyObject?) {
        addMenuItemWithItemIcon(
            WKMenuItemIcon.Decline,
            title: NSLocalizedString("Back", value: "Back", comment: "")
            ,
            action: nil
        )
        super.awakeWithContext(context)
    }
    
    override func willActivate() {
        addInformationToScreen()
        startStandardUpdates()
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Private Methods
    
    func addInformationToScreen() {
        let seasonName = NSLocalizedString(self.seasons.currentSeason.name, value: self.seasons.currentSeason.name, comment: "")
        let daysUntil = NSLocalizedString("Days until", value: "Days until", comment: "")
        let days = self.seasons.daysUntilNextSeason
        let nextSeason = NSLocalizedString(self.seasons.nextSeason.name,
                                           value:(self.seasons.nextSeason.name),
                                           comment: "")
        
        self.currentSeasonImageView.setImage(UIImage(named: "\(self.seasons.currentSeason.name)_Watch"))
        self.daysLabel.setText("\(days)")
        self.descriptionLabel.setText(daysUntil)
        self.nextSeasonLabel.setText(nextSeason)
        self.nextSeasonLabel.setTextColor(self.seasons.colors[self.seasons.nextSeason.name])
    }
    
    func startStandardUpdates() {
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.requestWhenInUseAuthorization()
        // TODO
//        self.locationManager.startUpdatingLocation()
    }
    
    // MARK: CLLocationManagerDelegate Methods

    // TODO
    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        let location = locations.last as! CLLocation
//        if (location.coordinate.latitude < 0) {
//            self.seasons.isSouthernHemisphere = true;
//        }
//        addInformationToScreen()
//    }
//    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.NotDetermined ||
            status == CLAuthorizationStatus.AuthorizedWhenInUse) {
            // TODO
//            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.locationManager.stopUpdatingLocation()
    }
}