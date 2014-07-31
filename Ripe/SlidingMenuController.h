//
//  SlidingMenuController.h
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoController.h"
#import "IDMPhotoBrowser.h"
#import "FoodItem.h"
@interface SlidingMenuController : UIViewController
@property (strong,nonatomic) FoodItem * foodItem;
@property (strong, nonatomic) IBOutlet UILabel *rankNumber;
@property (strong, nonatomic) IBOutlet UIImageView *ratingImage;
@property (strong, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;
@property(strong,nonatomic)UINavigationController *navigationController;
@property (strong, nonatomic) IBOutlet UIImageView *foodImage;
- (IBAction)informationButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *reviewButton;
- (IBAction)infoButton:(id)sender;
@property (strong, nonatomic) InfoController *detailed;
- (IBAction)reviewButton:(id)sender;

-(id)initWithDetailedController:(InfoController *)info;
@end
