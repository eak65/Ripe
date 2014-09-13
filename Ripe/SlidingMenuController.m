//
//  SlidingMenuController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "SlidingMenuController.h"
#import "RatingViewController.h"
#import "AppDelegate.h"
#import "Photo.h"
@interface SlidingMenuController ()
{
    BOOL a;
}
@end

@implementation SlidingMenuController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)menuImageTapped:(id)sender
{
    NSMutableArray *photos = [NSMutableArray new];
  /*
    for (NSURL *url in self.searchResult.photoUrls)
    {
        IDMPhoto *photo = [IDMPhoto photoWithURL:url];
        [photos addObject:photo];
        
    }
   */
   // IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:photos];
    
 //   [self presentViewController:browser animated:YES completion:nil];
}
-(id)initWithFoodItem:(FoodItem *)item
{
    self.foodItem=item;
    return self;
}

-(id)initWithDetailedController:(InfoController *)info
{
    self.detailed=info;
    UITapGestureRecognizer * menuTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(menuImageTapped:)];
    self.foodImage.userInteractionEnabled = YES;
    [self.foodImage addGestureRecognizer:menuTap];
  
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    a=NO;

    if(self.foodItem.Photos.count>0){
    Photo *photo= self.foodItem.Photos[0];
        UITapGestureRecognizer * gesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchFoodItem)];
        
    NSURL *url = [NSURL URLWithString:photo.URI];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
        
    self.foodImage.image=img;
        [[super view] bringSubviewToFront:self.foodImage];
        self.foodImage.userInteractionEnabled=YES;
        [self.foodImage addGestureRecognizer:gesture];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didTouchFoodItem
{
    NSMutableArray * url=[NSMutableArray array];
    for(Photo * p in self.foodItem.Photos)
    {
        [url addObject:[NSURL URLWithString:p.URI]];
    }
    
    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:[IDMPhoto photosWithURLs:url]];
    UIViewController *vc= [super self];
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [delegate.mainNav presentViewController:browser animated:YES completion:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)informationButton:(id)sender {
    
    [UIView transitionFromView:self.view toView:self.detailed.view duration:0.75 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    
}
- (IBAction)reviewButton:(id)sender {
    RatingViewController *rating =[[RatingViewController alloc]initWithStyle:UITableViewStyleGrouped];
    UINavigationController * navRating =[[UINavigationController alloc] initWithRootViewController:rating];
    [self.navigationController presentViewController:navRating animated:YES completion:nil];

}
- (IBAction)infoButton:(id)sender {
    
    


        if (a == NO) {
            [UIView transitionFromView:self.view toView:self.detailed.view
                              duration:.4
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            completion:NULL];
            a = YES; // a = !a;
        }
        else {
            [UIView transitionFromView:self.detailed.view toView:self.foodImage
                              duration:1.0
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            completion:NULL];
            a = NO; // a = !a;
        }

    
  // [UIView transitionFromView:self.foodImage toView:self.detailed.view duration:0.75 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    
}
@end
