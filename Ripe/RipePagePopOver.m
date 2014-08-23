//
//  RipePagePopOver.m
//  Ripe
//
//  Created by Ethan Keiser on 5/28/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "RipePagePopOver.h"
#import "InfoController.h"
#import "Rating.h"
#import "RatingViewController.h"
#import "SlidingMenuController.h"
#import "Menu.h"
#import "RestaurantLandingController.h"
@interface RipePagePopOver ()
{
    NSString *menuLabel;
    Menu *menu;
    NSMutableArray *scrollViews;
    int currentPage;
}
@end

@implementation RipePagePopOver

-(id)initWithMenu:(Menu *)m
{
    menu=m;
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
   
    [self.delegate willBeginToChangeViews];
}

-(void)back:(id)sender
{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)setFoodItemList:(NSMutableArray *)list
{
    self.items=list;
    [self averageRankForFood:list];
}
-(void)averageRankForFood:(NSMutableArray *) oldlist
{
   
    for(FoodItem * food in oldlist)
    {
        int count=0;
        int total=0;

        for(Rating *r in food.Ratings)
        {
            total+=[r.Score intValue];
            count++;
        }
        if(count>0)
      food.rank=total/count;
        else
            food.rank=0;
    }
    
    self.items=[NSMutableArray arrayWithArray:[self bubbleSort:oldlist]];

}

-(NSArray *)bubbleSort:(NSMutableArray *)unsortedDataArray
{
    long count = unsortedDataArray.count;
    int i;
    bool swapped = TRUE;
    while (swapped){
        swapped = FALSE;
        for (i=1; i<count;i++)
        {
            if (((FoodItem *)[unsortedDataArray objectAtIndex:(i-1)]).rank < ((FoodItem *)[unsortedDataArray objectAtIndex:i]).rank)
            {
                [unsortedDataArray exchangeObjectAtIndex:(i-1) withObjectAtIndex:i];
                swapped = TRUE;
            }
            //bubbleSortCount ++; //Increment the count everytime a switch is done, this line is not required in the production implementation.
        }
    }
    return unsortedDataArray;
}

-(void)reload{
    UIView *subview;
    [scrollViews removeAllObjects];

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
        InfoController * info =[[InfoController alloc]initWithView:sliding.view andFoodItem:[self.items objectAtIndex:i]];
        
        [sliding.view setFrame:frame];
        [info.view setFrame:frame];
        sliding.navigationController=self.navigationController;
        //  [info.view setFrame:sliding.foodImage.frame];
        
        
        sliding.detailed=info;
        
        NSLog(@"%f %f",sliding.view.frame.size.width,sliding.view.frame.size.height);
        
        NSLog(@"%f %f",info.view.frame.size.width,info.view.frame.size.height);
        [scrollViews addObject:sliding];
        sliding.foodNameLabel.text=[NSString stringWithFormat:@"%d",i];
        sliding.foodItem=[self.items objectAtIndex:i];
        
        //[subview addSubview:sliding.view];
        // [subview setBackgroundColor:[UIColor greenColor]];
        [self.scrollView addSubview:sliding.view];
        [self.scrollView bringSubviewToFront:sliding.view];
        
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.items.count, 0);


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
    UIBarButtonItem *left=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=left;
    //self.items =menu.foodItems;
  
    self.scrollView.clipsToBounds=YES;
    if(self.items.count>0){
  
        currentPage=0;
        [self reload];
    }
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    if(self.items.count>0){
    SlidingMenuController * sl=[scrollViews objectAtIndex:currentPage];
    self.appDelegate.food=sl.foodItem;
        
    }
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

    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page= floor((self.scrollView.contentOffset.x-pageWidth/2) / pageWidth)+1;
    
    SlidingMenuController * sl=[scrollViews objectAtIndex:currentPage];

    if(currentPage !=page)
    {
            [sl.detailed reverse];
        currentPage=page;
        NSInteger i= currentPage;
        NSLog(@"%ld",(long)i);
        [self.delegate didChangeViewsToSelection:currentPage];

    }
    
    self.appDelegate.food=sl.foodItem;
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
