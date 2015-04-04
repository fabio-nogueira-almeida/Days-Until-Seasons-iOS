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

- (void)_addInformationToScreen;

@end

@implementation ViewController

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self _addInformationToScreen];
}

#pragma mark - Private Methods

- (void)_addInformationToScreen {
    Seasons *seasons = [[Seasons alloc] init];
    
    NSString *imageNamed = NSLocalizedString(seasons.currentSeason.name, nil);
    NSString *daysUntil = NSLocalizedString(@"Days until", nil);
    NSString *days = [NSString stringWithFormat:@"%ld", (long)seasons.daysUntilNextSeason];
    NSString *nextSeason = seasons.nextSeason.name;
    
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
