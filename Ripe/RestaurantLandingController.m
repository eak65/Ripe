//
//  RestaurantLandingController.m
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "IDMPhotoBrowser.h"
#import "RestaurantLandingController.h"
#import "SearchResult.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
#import "InfoController.h"
#import "SlidingMenuController.h"
#import "RipePagePopOver.h"
@interface RestaurantLandingController ()
{
    DKScrollingTabController *leftTabController;
    NSMutableArray * infolist;
    InfoController *info;
    SlidingMenuController *slider;
}
@end

@implementation RestaurantLandingController

- (id)initWithSearchResult:(SearchResult *)search
{

        self.searchResult=search;
    [self.searchResult setPhotoUrls];
    
                        

    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    infolist= [NSMutableArray array];
    self.navigationController.navigationBar.translucent=NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    slider=[[SlidingMenuController alloc]init];
    slider.navigationController=self.navigationController;
    InfoController *infoCon=[[InfoController alloc]initWithView:slider.view];
    slider.detailed=infoCon;
    slider.foodNameLabel.text=@"tesr";
    [self.menuView addSubview:slider.view];
    
 
    self.restaurantImage.userInteractionEnabled=NO;
    
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidesWhenStopped=YES;
    
    self.restaurantImage.image=[UIImage imageNamed:@"placeholder.jpeg"];
    
    [self getImage];
    self.title=self.searchResult.name;
    self.menuView.userInteractionEnabled=YES;

    // self.scrollView.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y
     //                                , self.view.frame.size.width, self.view.frame.size.height);
    self.scrollView.delegate=self;
    
    leftTabController = [[DKScrollingTabController alloc] init];

    leftTabController.delegate = self;
    [self addChildViewController:leftTabController];
    [leftTabController didMoveToParentViewController:self];
    [self.tabScrollerView addSubview:leftTabController.view];
    leftTabController.view.frame = CGRectMake(0, 20, 320, 40);
    
    leftTabController.view.backgroundColor = [UIColor whiteColor];
    leftTabController.buttonPadding = 10;
    leftTabController.underlineIndicator = YES;
    leftTabController.underlineIndicatorColor = [UIColor redColor];
    leftTabController.buttonsScrollView.showsHorizontalScrollIndicator = NO;
    leftTabController.selectedBackgroundColor = [UIColor clearColor];
    leftTabController.selectedTextColor = [UIColor blackColor];
    leftTabController.unselectedTextColor = [UIColor grayColor];
    leftTabController.unselectedBackgroundColor = [UIColor clearColor];
    
    leftTabController.selection = @[@"PLACE\n0", @"PLACE\n0", @"PLACE\n0", @"PLACE\n0"];
    [leftTabController setButtonName:@"Appetizer" atIndex:0];
    [leftTabController setButtonName:@"Entree" atIndex:1];
    [leftTabController setButtonName:@"Desert" atIndex:2];
    [leftTabController setButtonName:@"Drinks" atIndex:3];
    leftTabController.selectedTitle=@"Appetizer";


    
    
    
    
    self.scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width,800);
    self.automaticallyAdjustsScrollViewInsets = NO;
}
-(void)viewDidAppear:(BOOL)animated
{
    
  

}
- (void)DKScrollingTabController:(DKScrollingTabController*)controller selection:(NSUInteger)selection
{
    
}

-(void)getImage{

// load image
if(self.searchResult.photoUrls.count>0)
{
   

UIImage  *placeHolder=[UIImage imageNamed:@"test"];
    [self.restaurantImage setImageWithURLRequest:[NSURLRequest requestWithURL:[self.searchResult.photoUrls objectAtIndex:0]] placeholderImage:placeHolder
                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                              [self.activityIndicator stopAnimating];
                              self.restaurantImage.image=image;
                          } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                             
                              NSLog(@"REQUEST FAILED");
                           [self.activityIndicator stopAnimating];
                          }];
}
else{
      [self.activityIndicator stopAnimating];
}
}



-(void) restaurantPhotoTouched
{
    // URLs array
  

    
    // Create an array to store IDMPhoto objects
    NSMutableArray *photos = [NSMutableArray new];
    
    for (NSURL *url in self.searchResult.photoUrls)
    {
        IDMPhoto *photo = [IDMPhoto photoWithURL:url];
        [photos addObject:photo];
    }
    
    // Or use this constructor to receive an NSArray of IDMPhoto objects from your NSURL objects
  //  NSArray *photos = [IDMPhoto photosWithURLs:photosURL];
    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:photos];

[self presentViewController:browser animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)open:(id)sender {
    UINavigationController * nav=[[UINavigationController alloc] initWithRootViewController:[[RipePagePopOver alloc]initWithMenu:leftTabController.selectedTitle]];
    [self.navigationController presentViewController:nav animated:YES completion:nil];

}


@end
