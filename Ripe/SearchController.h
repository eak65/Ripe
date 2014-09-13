//
//  SearchController.h
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNBlurModalView.h"
#import <CoreLocation/CoreLocation.h>
#import "constants.h"
@interface SearchController : UIViewController <UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>
<<<<<<< HEAD
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLLocation *location;

@property (nonatomic ,strong) RNBlurModalView *modal;
@property (nonatomic ,strong) NSMutableArray *totalSearchResult;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
