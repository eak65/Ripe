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
<<<<<<< HEAD
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
#import "ProfileController.h"
@interface AppDelegate : UIResponder <UITabBarDelegate,UIApplicationDelegate,BaseViewDelegate ,ProfileDelegate, RNGridMenuDelegate>{
}
=======

@interface AppDelegate : UIResponder <UIApplicationDelegate,BaseViewDelegate , RNGridMenuDelegate>
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property ( strong, nonatomic) RNGridMenu * av;
@property ( strong, nonatomic) UINavigationController * mainNav;
<<<<<<< HEAD
@property(strong,nonatomic)FoodItem * food;
@property(strong,nonatomic)Restaurant * restaurant;
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
