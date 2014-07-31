//
//  RipePagePopOver.m
//  Ripe
//
//  Created by Ethan Keiser on 5/28/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "RipePagePopOver.h"
#import "InfoController.h"
#import "RatingViewController.h"
#import "SlidingMenuController.h"
#import "RestaurantLandingController.h"
@interface RipePagePopOver ()
{
    NSString *menuLabel;
    NSMutableArray *scrollViews;
}
@end

@implementation RipePagePopOver

-(id)initWithMenu:(NSString *)menu
{
    menuLabel=menu;
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillDisappear:(BOOL)animated
{
//self.appDelegate.food=nil;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.delegate didChangeViews];

}

-(void)back:(id)sender
{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate=self;
    [self.view superview];
    self.appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    scrollViews =[NSMutableArray array];
    self.transView =[NSMutableArray array];
    self.navigationController.navigationBar.translucent=NO;
    self.tabBarController.tabBar.translucent=NO;
    UIBarButtonItem *left=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(back:)];
    self.pageControl.userInteractionEnabled=NO;
    self.navigationItem.leftBarButtonItem=left;
    self.MenuLabel.text=menuLabel;
    self.items =[NSMutableArray array];
    [self.items addObject:@""];
    [self.items addObject:@""];
    [self.items addObject:@""];
    [self.items addObject:@""];
    [self.items addObject:@""];
    [self.items addObject:@""];
    self.scrollView.clipsToBounds=YES;
    self.pageControl.numberOfPages=self.items.count;
    self.pageControl.pageIndicatorTintColor=[UIColor redColor];
    self.pageControl.currentPageIndicatorTintColor=[UIColor greenColor];
    self.pageControl.currentPage=0;
     UIView *subview;
    for(int i =0; i< self.items.count;i++)
    {
        int rank = i;
        rank++;
        CGRect frame;
        frame.origin.x=self.scrollView.frame.size.width*i;
        frame.origin.y=0;
        frame.size=self.scrollView.frame.size;
        SlidingMenuController * sliding=[[SlidingMenuController alloc]init];
        [sliding view];
        InfoController * info =[[InfoController alloc]initWithView:sliding.view];
        [sliding.view setFrame:frame];
        [info.view setFrame:frame];
        sliding.navigationController=self.navigationController;
      //  [info.view setFrame:sliding.foodImage.frame];
       
     
        sliding.detailed=info;
        
        NSLog(@"%f %f",sliding.view.frame.size.width,sliding.view.frame.size.height);
        
        NSLog(@"%f %f",info.view.frame.size.width,info.view.frame.size.height);
        [scrollViews addObject:sliding];
        sliding.foodNameLabel.text=[NSString stringWithFormat:@"%d",i];
    
        //[subview addSubview:sliding.view];
       // [subview setBackgroundColor:[UIColor greenColor]];
        [self.scrollView addSubview:sliding.view];
        [self.scrollView bringSubviewToFront:sliding.view];

    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.items.count, 0);
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    SlidingMenuController * sl=[scrollViews objectAtIndex:self.pageControl.currentPage];
    self.appDelegate.food=sl.foodItem;
}
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(![viewController isEqual:self])
    {
        self.appDelegate.food=nil;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.smileyImage.image=[UIImage imageNamed:@"smle.jpeg"];

    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page= floor((self.scrollView.contentOffset.x-pageWidth/2) / pageWidth)+1;
    self.pageControl.currentPage=page;
    
    SlidingMenuController * sl=[scrollViews objectAtIndex:self.pageControl.currentPage];
    
    self.appDelegate.food=sl.foodItem;


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
