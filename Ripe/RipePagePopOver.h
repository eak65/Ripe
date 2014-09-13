//
//  RipePagePopOver.h
//  Ripe
//
//  Created by Ethan Keiser on 5/28/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "Menu.h"
#import "InfoController.h"
@protocol RipePageDelegate
-(void)willBeginToChangeViews;
-(void)didChangeViewsToSelection:(int)selection;
@end
@interface RipePagePopOver : UIViewController  <UINavigationControllerDelegate,UIScrollViewDelegate>
@property(strong,nonatomic) id <RipePageDelegate>delegate;
@property(weak,nonatomic)AppDelegate * appDelegate;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableDictionary * viewDictionary;
@property (strong, nonatomic) InfoController *infoController;
@property (strong, nonatomic) NSMutableArray * items;
@property (strong, nonatomic) NSMutableArray *scrollViews;
@property (strong, nonatomic) NSMutableArray *transView;
@property (strong, nonatomic) NSNumber *currentIndex;
@property(strong,nonatomic) FoodItem * selectedFoodItem;
-(id)initWithMenu:(Menu *)m;
-(void)setFoodItemList:(NSMutableArray *)list;
-(void)reload;
@end
