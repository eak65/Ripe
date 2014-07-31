//
//  ProfileController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "RatingViewController.h"

#import "ProfileController.h"
@interface ProfileController ()
{
    DKScrollingTabController *leftTabController;
    SBInstagramCollectionViewController *instagram ;
    RatingViewController * ratingController;
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
    self.profileImage.image=[UIImage imageNamed:@"me.jpg"];
    ratingController = [[RatingViewController alloc]init];
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

    
    
    //here create the instagram view
   instagram= [SBInstagramController instagramViewController];
    
    NSLog(@"framework version: %@",instagram.version);
    
    //both are optional, but if you need search by tag you need set both
    instagram.isSearchByTag = YES; //if you want serach by tag
    instagram.searchTag = @"colombia"; //search by tag query
    
    //    instagram.showOnePicturePerRow = YES; //to change way to show the feed, one picture per row(default = NO)
    
    instagram.showSwitchModeView = YES; //show a segment controller with view option
    
    [self.selectionView addSubview:instagram.view];

    //    [instagram refreshCollection]; //refresh instagram feed
    // Do any additional setup after loading the view from its nib.
}
-(void)checkAndRemove:(UIView *)parentView andChildView:(UIView *) child
{
    NSArray *views=[parentView subviews];
    BOOL found=NO;
    for(UIView * v in views)
    {
        if([v  isKindOfClass:[child class]])
        {
            found=YES;
        }
    }
    if(!found)
    {
        [parentView addSubview:child];
    }

}
- (void)DKScrollingTabController:(DKScrollingTabController*)controller selection:(NSUInteger)selection
{
    if(selection==0)
    {
        // remove the other two views
        [ratingController.view removeFromSuperview];
        [self checkAndRemove:self.selectionView andChildView:instagram.view];
    }
    else if(selection==1)
    {
        [instagram.view removeFromSuperview];
        
        [self checkAndRemove:self.selectionView andChildView:ratingController.view];
    }
    else{
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
