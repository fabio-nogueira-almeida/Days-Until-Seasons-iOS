//
//  ViewController.m
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

#import "ViewController.h"
#import "Days_Until_Seasons-swift.h"

@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) Seasons *seasons;

- (void)_addInformationToScreen;

@end

@implementation ViewController

#pragma mark - Getter Methods

- (Seasons *)seasons {
    if (!_seasons) {
        _seasons = [[Seasons alloc] init];
    }
    return _seasons;
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

#pragma mark - UIViewController Methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self _addInformationToScreen];
    [self _startStandardUpdates];
}

#pragma mark - Private Methods

- (void)_startStandardUpdates {
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)_addInformationToScreen {
    NSString *imageNamed = self.seasons.currentSeason.name;
    NSString *daysUntil = NSLocalizedString(@"Days until", nil);
    NSString *days = [NSString stringWithFormat:@"%ld", (long)self.seasons.daysUntilNextSeason];
    NSString *nextSeason = NSLocalizedString(self.seasons.nextSeason.name, nil);
    self.currentSeasonImageView.image = [UIImage imageNamed:imageNamed];
    self.currentSeasonLabel.text = NSLocalizedString(imageNamed, nil);
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSString *ipadText = [NSString stringWithFormat:@"%@ %@ %@", days, daysUntil, nextSeason];
        self.descriptionIpadLabel.text = ipadText;

    } else {
        self.daysLabel.text = days;
        self.descriptionLabel.text = daysUntil;
        self.nextSeasonLabel.text = nextSeason;
    }
}

#pragma mark - CLocationManagerDelete Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    if (location.coordinate.latitude < 0) {
        self.seasons.isSouthernHemisphere = YES;
    }
    [self _addInformationToScreen];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusNotDetermined ||
        status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.locationManager stopUpdatingLocation];
}

@end
