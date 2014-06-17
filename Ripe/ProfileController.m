//
//  ProfileController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "ProfileController.h"
@interface ProfileController ()
{
    DKScrollingTabController *leftTabController;
}
@end

@implementation ProfileController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent=NO;
  self.usernameField.text=  [DataManager shared].userName;
    self.emailField.text=[DataManager shared].email;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back)];
    
    leftTabController = [[DKScrollingTabController alloc] init];
    
    leftTabController.delegate = self;
    [leftTabController didMoveToParentViewController:self];
    [self.tabScrollerBar addSubview:leftTabController.view];
    leftTabController.view.frame = CGRectMake(0, 20, 320, 40);
    
    leftTabController.view.backgroundColor = [UIColor whiteColor];
    leftTabController.buttonPadding = 30;
    leftTabController.underlineIndicator = YES;
    leftTabController.underlineIndicatorColor = [UIColor redColor];
    leftTabController.buttonsScrollView.showsHorizontalScrollIndicator = NO;
    leftTabController.selectedBackgroundColor = [UIColor clearColor];
    leftTabController.selectedTextColor = [UIColor blackColor];
    leftTabController.unselectedTextColor = [UIColor grayColor];
    leftTabController.unselectedBackgroundColor = [UIColor clearColor];
    
    leftTabController.selection = @[@"PLACE\n0", @"PLACE\n0", @"PLACE\n0"];
    [leftTabController setButtonName:@"Photos" atIndex:0];
    [leftTabController setButtonName:@"Ranks" atIndex:1];
    [leftTabController setButtonName:@"Reviews" atIndex:2];
    leftTabController.selectedTitle=@"Photos";

    // Do any additional setup after loading the view from its nib.
}
- (void)DKScrollingTabController:(DKScrollingTabController*)controller selection:(NSUInteger)selection
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
