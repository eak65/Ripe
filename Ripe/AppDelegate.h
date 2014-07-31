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


@interface AppDelegate : UIResponder <UIApplicationDelegate,BaseViewDelegate , RNGridMenuDelegate>{
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property ( strong, nonatomic) RNGridMenu * av;
@property ( strong, nonatomic) UINavigationController * mainNav;
@property(strong,nonatomic)FoodItem * food;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
