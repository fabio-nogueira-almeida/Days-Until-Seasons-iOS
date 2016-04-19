//
//  TodayViewController.swift
//  Days Until Seasons Today
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import UIKit
import NotificationCenter
import CoreLocation

class TodayViewController: UIViewController, NCWidgetProviding, CLLocationManagerDelegate {
        
    @IBOutlet weak var currentSeasonImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var seasons: Seasons = Seasons ()
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(320, 60);
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addInformationToScreen()
        startStandardUpdates()
    }
    
    // MARK: Private Methods
    
    func addInformationToScreen() {
        _ = NSLocalizedString(self.seasons.currentSeason.name, value: self.seasons.currentSeason.name, comment: "")
        let daysUntil = NSLocalizedString("Days until", value: "Days until", comment: "")
        
        self.currentSeasonImageView.image = UIImage(named: self.seasons.currentSeason.name)
        
        let nextSeasonLocalizedString = NSLocalizedString(
            self.seasons.nextSeason.name,
            value: self.seasons.nextSeason.name,
            comment: "")
        
        let descriptionText = "\(self.seasons.daysUntilNextSeason) \(daysUntil) \(nextSeasonLocalizedString)"
        self.descriptionLabel.text = descriptionText;
    }
    
    func startStandardUpdates() {
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    // MARK: Today Methods
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets{
        return UIEdgeInsetsZero;
    }
    
    // MARK: CLLocationManagerDelegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        if (location.coordinate.latitude < 0) {
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
