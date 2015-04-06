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
import CoreLocation

class GlanceController: WKInterfaceController, CLLocationManagerDelegate {
    
    @IBOutlet weak var daysLabel: WKInterfaceLabel!
    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var nextSeasonLabel: WKInterfaceLabel!
    
    var seasons: Seasons = Seasons ()
    var locationManager: CLLocationManager = CLLocationManager()

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
        let daysUntil = NSLocalizedString("Days until", value: "Days until", comment: "")
        let days = self.seasons.daysUntilNextSeason
        let nextSeason = "\(self.seasons.nextSeason.name)_description"
        
        self.daysLabel.setText("\(days)")
        self.descriptionLabel.setText(daysUntil)
        self.nextSeasonLabel.setText(nextSeason)
    }
    
    func startStandardUpdates() {
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    // MARK: CLLocationManagerDelegate Methods
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as CLLocation
        if (location.coordinate.latitude > 0) {
            self.seasons.isNorthernHemisphere = true;
            addInformationToScreen()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {}

}
