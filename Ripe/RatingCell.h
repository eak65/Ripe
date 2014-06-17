//
//  RatingCell.h
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UIImageView *ratingImage;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UITextView *commentTextView;

@end
