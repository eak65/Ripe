//
//  RipePagePopOver.h
//  Ripe
//
//  Created by Ethan Keiser on 5/28/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoController.h"
@interface RipePagePopOver : UIViewController  <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UILabel *MenuLabel;
@property (strong, nonatomic) IBOutlet UILabel *foodName;
@property (strong, nonatomic) IBOutlet UIImageView *smileyImage;
@property (strong, nonatomic) IBOutlet UIImageView *foodImage;
@property (strong, nonatomic) IBOutlet UILabel *rankNumber;
@property (strong, nonatomic) NSMutableDictionary * viewDictionary;
- (IBAction)informationButton:(id)sender;
@property (strong, nonatomic) InfoController *infoController;
@property (strong, nonatomic) NSMutableArray * items;
@property (strong, nonatomic) NSMutableArray *scrollViews;
@property (strong, nonatomic) NSMutableArray *transView;
-(id)initWithMenu:(NSString *)menu;
@end
