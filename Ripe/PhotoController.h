//
//  PhotoController.h
//  Ripe
//
//  Created by Ethan Keiser on 6/19/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCameraViewController.h"
@interface PhotoController : UIViewController <YCameraViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *foodImage;

- (IBAction)save:(id)sender;
@end
