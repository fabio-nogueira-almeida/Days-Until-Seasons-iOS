//
//  ViewController.h
//  Days Until Seasons
//
//  Created by Fábio Nogueira de Almeida on 31/03/15.
//  Copyright (c) 2015 Fábio Nogueira de Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *currentSeasonImageView;
@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextSeasonLabel;

@end

