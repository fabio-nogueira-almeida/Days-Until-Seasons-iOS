//
//  ViewController.m
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

#import "ViewController.h"

@import DUSFramework;

@interface ViewController ()

- (void)_addInformationToScreen:(Season *)season;

@end

@implementation ViewController

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self _addInformationToScreen:[Seasons currentSeason]];
}

#pragma mark - Private Methods

- (void)_addInformationToScreen:(Season *)season {
    NSString *imageNamed = NSLocalizedString(season.name, nil);
    NSString *daysUntil = NSLocalizedString(@"Days until", nil);
    NSString *days = @"184";
    NSString *nextSeason = @"Spring";
    
    self.currentSeasonImageView.image = [UIImage imageNamed:imageNamed];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSString *ipadText = [NSString stringWithFormat:@"%@ %@ %@", days, daysUntil, nextSeason];
        self.descriptionIpadLabel.text = ipadText;
    } else {

        self.currentSeasonLabel.text = imageNamed;
        self.daysLabel.text = days;
        self.descriptionLabel.text = daysUntil;
        self.nextSeasonLabel.text = nextSeason;
    }
}

@end
