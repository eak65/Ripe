//
//  RatingController.h
//  Ripe
//
//  Created by Ethan Keiser on 6/18/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNBlurModalView.h"

@interface RatingOptionController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *foodImage;

@property (nonatomic ,strong) RNBlurModalView *modal;
@property (strong, nonatomic) IBOutlet UITextView *textView;

- (IBAction)postReviewButton:(id)sender;

@end
