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
#import <AVFoundation/AVFoundation.h>
#import "ExtraInfoController.h"
#import <AFNetworking.h>
#import "RatingCell.h"
#import "constants.h"
#import "NSObject+ObjectMap.h"
#import "SearchController.h"
#import "DoAlertView.h"
#import "AFNetworking.h"
#import "InfoController.h"
#import "Restaurant.h"
#import "SlidingMenuController.h"
#import "RipePagePopOver.h"
@interface RestaurantLandingController ()
{
    DKScrollingTabController *leftTabController;
    NSMutableArray * infolist;
    InfoController *info;
    SlidingMenuController *slider;
    RipePagePopOver * ripePage;
    Restaurant * restaurant;
    NSMutableArray * ripePages;
    UIImageView *logoView ;
}
@end

@implementation RestaurantLandingController

- (id)initWithSearchResult:(SearchResult *)search
{

        self.searchResult=search;
    [self.searchResult setPhotoUrls];
    
                        

    
    return self;
}
-(void)infoTouched
{
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:[[ExtraInfoController alloc]init]] ;
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(![viewController isEqual:self])
    [logoView removeFromSuperview];
    if([SearchController isEqual:[viewController class]])
    {
        AppDelegate * delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        delegate.food=nil;
        delegate.restaurant=nil;
    }
    }

-(void)getLandingPage
{
    DoAlertView * alert=[[DoAlertView alloc]init];
    alert.nAnimationType=3;
    [alert doAlert:@"Searching" body:@"Searching..." duration:0.0 done:^(DoAlertView *alertView) {
        
    }];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]initWithBaseURL:[NSURL URLWithString:KBaseUrl]];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    NSDictionary *parameters=[NSDictionary dictionaryWithObjectsAndKeys:self.searchResult.id,@"googleId",self.searchResult.name,@"name",[NSString stringWithFormat:@"%f",self.searchResult.location.coordinate.latitude ],@"lat",[NSString stringWithFormat:@"%f",self.searchResult.location.coordinate.longitude],@"lon", nil];
    [manager GET:@"/api/Restaurant/GetRestaurantFromGoogle" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [alert hideAlert];
        if(operation.response.statusCode==204)
        {
            DoAlertView *valert=[[DoAlertView alloc]init];
            [valert doYes:@"Not Registered" body:@"Sorry this restaurant is not registerd with our service" yes:^(DoAlertView *alertView) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }
        else{
        NSError *error;
        NSData *dataFromDict = [NSJSONSerialization dataWithJSONObject:responseObject
                                                               options:NSJSONReadingAllowFragments
                                                                 error:&error];

         restaurant=[[Restaurant alloc] initWithJSONData:dataFromDict];
            
        [ripePages addObject:[[RipePagePopOver alloc]initWithMenu:restaurant.Appetizer]];
            [ripePages addObject:[[RipePagePopOver alloc]initWithMenu:restaurant.Entree]];
            [ripePages addObject:[[RipePagePopOver alloc]initWithMenu:restaurant.Dessert]];
            [ripePages addObject:[[RipePagePopOver alloc]initWithMenu:restaurant.Drink]];
            [ripePages addObject:[[RipePagePopOver alloc]initWithMenu:restaurant.SoupSalad]];
            AppDelegate * delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
            delegate.restaurant= restaurant;
    
            [leftTabController selectButtonWithIndex:1 delegate:YES];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [alert hideAlert];
    }];
        
}
-(void)setupPage:(Restaurant *)rest
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getLandingPage];
    ripePages=[NSMutableArray array];
   int yoffset= self.navigationController.navigationBar.frame.size.height;
    [self.scrollView setFrame:CGRectMake(0, yoffset*2+20, 320, self.scrollView.frame.size.height)];
    self.navigationController.delegate=self;
    infolist= [NSMutableArray array];
    self.navigationController.navigationBar.translucent=NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    UITapGestureRecognizer * touchMenu=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(restaurantPhotoTouched)];
    int width=(self.view.frame.size.width/2)+20;
   
   // logoView = [[UIImageView alloc] initWithFrame:CGRectMake(width,10,25,25)];
    
    
    //logoView.image=[UIImage imageNamed:@"drinks.jpeg"] ;
    //[logoView setUserInteractionEnabled:YES];

    //[logoView setContentMode:UIViewContentModeScaleAspectFit];
  //  [self.navigationController.navigationBar addSubview:logoView];
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(infoTouched)];
    self.title=self.searchResult.name;
    self.restaurantImage.userInteractionEnabled=NO;
    
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidesWhenStopped=YES;
    
    self.restaurantImage.image=[UIImage imageNamed:@"placeholder.jpeg"];
    
    [self getImage];
   // self.title=self.searchResult.name;
    self.menuView.userInteractionEnabled=YES;

    // self.scrollView.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y
     //                                , self.view.frame.size.width, self.view.frame.size.height);
    self.foodScroller.delegate=self;
    self.foodScroller.contentSize=CGSizeMake(self.foodScroller.frame.size.width,1300);
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    
    leftTabController.selection = @[@"PLACE\n0", @"PLACE\n0", @"PLACE\n0", @"PLACE\n0",@"PLACEEEE\n0"];
    [leftTabController setButtonName:@"Appetizer" atIndex:0];
    [leftTabController setButtonName:@"Entree" atIndex:1];
    [leftTabController setButtonName:@"Desert" atIndex:2];
    [leftTabController setButtonName:@"Drinks" atIndex:3];
    [leftTabController setButtonName:@"Soup/Salad" atIndex:4];

    leftTabController.selectedTitle=@"Appetizer";
    
    CGFloat ypos=self.tabScrollerView.frame.origin.y+ self.tabScrollerView.bounds.size.height;

   CGRect f= CGRectMake(0, ypos+20,self.menuView.frame.size.width, 370);
    [self.menuView setFrame:f];
    
    [self.scrollView scrollRectToVisible:CGRectMake(0, self.tabScrollerView.bounds.size.height, 320, 10) animated:YES];
  
    
    CGFloat tableypos=self.menuView.frame.origin.y+ self.menuView.bounds.size.height;
   // 160 * numofRow
    int tableheight=160*6;
    CGRect tableFrame=CGRectMake(0, tableypos, self.view.frame.size.width, tableheight);
    self.tableview=[[UITableView alloc]initWithFrame:tableFrame style:UITableViewStyleGrouped];
    
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.scrollEnabled=NO;
    [self.tableview setBackgroundColor:[UIColor whiteColor]];
    
    [self.scrollView addSubview:self.tableview];
    
   // CGFloat tableypos=self.scrollView.frame.origin.y+ self.scrollView.bounds.size.height;

    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.tableview.frame.size.height+self.tableview.frame.origin.y)];


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellId";
    
    
    RatingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[RatingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"RatingCell" owner:nil options:nil];
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[RatingCell class]])
            {
                cell=(RatingCell *)currentObject;
                break;
            }
        }
    }
    
    cell.commentTextView.layer.cornerRadius=5.0;
    cell.commentTextView.layer.borderColor=[[UIColor grayColor] CGColor];
    cell.commentTextView.layer.borderWidth=2.0;
    cell.commentTextView.userInteractionEnabled=NO;
    cell.ratingImage.userInteractionEnabled=NO;
    cell.userNameLabel.userInteractionEnabled=NO;
    cell.dateLabel.userInteractionEnabled=NO;
    cell.ratingImage.image=[UIImage imageNamed:@"mean.jpeg"];
    cell.dateLabel.text=[NSString stringWithFormat:@"%@",[NSDate date] ];
    cell.userNameLabel.text=@"Ethan";
    cell.profileImage.image=[UIImage imageNamed:@"me.jpg"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;

}
-(void)viewDidAppear:(BOOL)animated
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
  

}
-(void)viewWillAppear:(BOOL)animated
{
    [self didChangeViews];
}
-(void)didChangeViews
{
   
        [self.scrollView setContentOffset:CGPointMake(0, self.restaurantImage.frame.size.height) animated:YES];
  
}
- (void)DKScrollingTabController:(DKScrollingTabController*)controller selection:(NSUInteger)selection
{
    [ripePage.view removeFromSuperview];
    ripePage=[ripePages objectAtIndex:selection];
    ripePage.delegate=self;
    [self.menuView addSubview:ripePage.view];
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
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
    
   // for (NSURL *url in self.searchResult.photoUrls)
   // {
        IDMPhoto *photo = [IDMPhoto photoWithImage:slider.foodImage.image];
        [photos addObject:photo];
    //}
    
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



@end
