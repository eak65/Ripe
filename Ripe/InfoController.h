//
//  InfoController.h
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoController : UIViewController
- (IBAction)infoBackButton:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *price;
-(id)initWithView:(UIView *)backView;
@end
