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
<<<<<<< HEAD
#import "RipePagePopOver.h"
#import "FoodItem.h"
@interface RestaurantLandingController : UIViewController <RipePageDelegate,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,DKScrollingTabControllerDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *tabScrollerView;
@property (strong, nonatomic) IBOutlet UIImageView *smileyRating;
@property (strong, nonatomic) IBOutlet UIScrollView *foodScroller;


@property (strong, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

=======

@interface RestaurantLandingController : UIViewController <DKScrollingTabControllerDelegate>


@property (strong, nonatomic) IBOutlet UIView *tabScrollerView;

@property (strong, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
<<<<<<< HEAD
@property (strong, nonatomic) IBOutlet UIImageView *menuImageView;
=======
>>>>>>> 679adfcee06c2c82edf9c1d55c6356892cd4f1cb
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5

@property (strong, nonatomic) IBOutlet UIImageView *restaurantImage;
- (id)initWithSearchResult:(SearchResult *)search;
@property(nonatomic ,strong)SearchResult * searchResult;
@property (strong, nonatomic) IBOutlet UIView *menuView;
<<<<<<< HEAD
- (IBAction)open:(id)sender;
@property(retain,nonatomic)UITableView * tableview;
=======
@property (strong, nonatomic)  UIView *contentMenuView;
@property (strong, nonatomic) IBOutlet UILabel *test;
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5

@end
