//
//  GlanceController.swift
//  Days Until Seasons WatchKit 1 Extension
//
//  Created by Fabio Nogueira on 21/04/16.
//  Copyright © 2016 Fábio Nogueira de Almeida. All rights reserved.
//


import WatchKit
import Foundation
import CoreLocation
import DUSFramework

class GlanceController: WKInterfaceController, CLLocationManagerDelegate {
    
    @IBOutlet weak var daysLabel: WKInterfaceLabel!
    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var nextSeasonLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
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
        let nextSeason = NSLocalizedString(self.seasons.nextSeason.name,
                                           value:(self.seasons.nextSeason.name),
                                           comment: "")
        
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