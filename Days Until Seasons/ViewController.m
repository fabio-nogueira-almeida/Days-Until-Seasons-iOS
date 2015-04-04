//
//  ViewController.m
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

#import "ViewController.h"

@import DUSFramework;
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

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self _addInformationToScreen];
    [self _startStandardUpdates];
}

#pragma mark - Private Methods

- (void)_startStandardUpdates {
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startMonitoringSignificantLocationChanges];
    [self.locationManager startUpdatingLocation];
}

- (void)_addInformationToScreen {
    NSString *imageNamed = NSLocalizedString(self.seasons.currentSeason.name, nil);
    NSString *daysUntil = NSLocalizedString(@"Days until", nil);
    NSString *days = [NSString stringWithFormat:@"%ld", (long)self.seasons.daysUntilNextSeason];
    NSString *nextSeason = self.seasons.nextSeason.name;
    
    self.currentSeasonImageView.image = [UIImage imageNamed:imageNamed];
    self.currentSeasonLabel.text = imageNamed;
    
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
    if (location.coordinate.latitude > 0) {
        self.seasons.isNorthernHemisphere = YES;
        [self _addInformationToScreen];
    }
}

@end
