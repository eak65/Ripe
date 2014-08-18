//
//  AppDelegate.h
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNGridMenu.h"
#import "BaseViewController.h"
#import "FoodItem.h"
#import "Restaurant.h"
#import "SearchResult.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIEcommerceProduct.h"
#import "GAIEcommerceProductAction.h"
#import "GAIEcommercePromotion.h"
#import "GAIFields.h"
#import "GAILogger.h"
#import "GAITrackedViewController.h"
#import "GAITracker.h"
@interface AppDelegate : UIResponder <UITabBarDelegate,UIApplicationDelegate,BaseViewDelegate , RNGridMenuDelegate>{
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property ( strong, nonatomic) RNGridMenu * av;
@property ( strong, nonatomic) UINavigationController * mainNav;
@property(strong,nonatomic)FoodItem * food;
@property(strong,nonatomic)Restaurant * restaurant;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
