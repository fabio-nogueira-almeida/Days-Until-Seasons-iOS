//
//  InterfaceController.swift
//  Days Until Seasons WatchKit 1 Extension
//
//  Created by Fabio Nogueira on 21/04/16.
//  Copyright © 2016 Fábio Nogueira de Almeida. All rights reserved.
//

import WatchKit
import Foundation
import DUSFramework

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
        super.didDeactivate()
    }
    
    // MARK: Private Methods
    
    func addInformationToScreen() {
        let seasonName = NSLocalizedString(self.seasons.currentSeason.name, value: self.seasons.currentSeason.name, comment: "")
        let daysUntil = NSLocalizedString("Days until", value: "Days until", comment: "")
        let days = self.seasons.daysUntilNextSeason
        let nextSeason = NSLocalizedString(seasonName,
                                           value:(seasonName),
                                           comment: "")
        
        self.currentSeasonImageView.setImage(UIImage(named: "\(self.seasons.currentSeason.name)_watch"))
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
        self.locationManager.startUpdatingLocation()
    }
    
    // MARK: CLLocationManagerDelegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        if (location!.coordinate.latitude < 0) {
            self.seasons.isSouthernHemisphere = true;
        }
        addInformationToScreen()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.NotDetermined ||
            status == CLAuthorizationStatus.AuthorizedWhenInUse) {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.locationManager.stopUpdatingLocation()
    }
}