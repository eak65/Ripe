//
//  ProfileController.h
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "DKScrollingTabController.h"
#import "SBInstagramCollectionViewController.h"
#import "SBInstagramController.h"
@protocol ProfileDelegate
-(void)didLogout:(id)sender;
@end

@interface ProfileController : UIViewController <DKScrollingTabControllerDelegate>
@property(weak , nonatomic)id<ProfileDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UIView *selectionView;

@property (strong, nonatomic) IBOutlet UIView *tabScrollerBar;
@property (strong, nonatomic) IBOutlet UITextField *quoteField;
@end
