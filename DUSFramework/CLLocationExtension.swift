//
//  CLLocationExtension.swift
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 04/04/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationManager {
    class func isSouthernHemisphere() -> Bool {
        var isShouthern = false
        
        var locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        var location = locationManager.location
        var coordinate = location.coordinate
        
        if (coordinate.latitude < 0) {
            isShouthern = true
        }
        return isShouthern
    }
}