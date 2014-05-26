//
//  RestaurantLandingController.h
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "constants.h"
#import "SearchResult.h"
#import "DKScrollingTabController.h"

@interface RestaurantLandingController : UIViewController <DKScrollingTabControllerDelegate>


@property (strong, nonatomic) IBOutlet UIView *tabScrollerView;

@property (strong, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) IBOutlet UIImageView *restaurantImage;
- (id)initWithSearchResult:(SearchResult *)search;
@property(nonatomic ,strong)SearchResult * searchResult;
@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic)  UIView *contentMenuView;
@property (strong, nonatomic) IBOutlet UILabel *test;

@end
