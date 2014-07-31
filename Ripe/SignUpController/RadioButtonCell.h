//
//  RadioButtonCell.h
//  Ripe
//
//  Created by Ethan Keiser on 7/16/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"
@interface RadioButtonCell : UITableViewCell

@property (strong, nonatomic) IBOutlet RadioButton *femaleButton;
@property (strong, nonatomic) IBOutlet RadioButton *maleButton;


@end
