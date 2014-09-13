//
//  AppDelegate.m
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
<<<<<<< HEAD
#import "ProfileController.h"
#import "RestaurantLandingController.h"
#import "AppDelegate.h"
#import "BaseViewController.h"
#import "FoodItem.h"
#import "LoginController.h"
#import "SearchPhotoController.h"
#import "SearchController.h"
#import "FoodSelectorController.h"
#import "DataManager.h"
=======

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "LoginController.h"
#import "SearchController.h"
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
<<<<<<< HEAD
    
    
    
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval =10;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-53872836-1"];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    
    
    
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    LoginController * login=[[LoginController alloc]init];
    UINavigationController * navigation=[[UINavigationController alloc]initWithRootViewController:login];
    BaseViewController *tabBar = [[BaseViewController alloc]init];
    tabBar.actionDelegate=self;
<<<<<<< HEAD

    tabBar.delegate=self;
      [tabBar addCenterButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:[UIImage imageNamed:@"tabBar_cameraButton_ready_matte.png"]];
    
=======
      [tabBar addCenterButtonWithImage:[UIImage imageNamed:@"camera_button_take.png"] highlightImage:[UIImage imageNamed:@"tabBar_cameraButton_ready_matte.png"]];

>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
  self.mainNav=[[UINavigationController alloc]initWithRootViewController:[[SearchController alloc]init]];
    NSArray *tabs=[NSArray arrayWithObject:self.mainNav];
    [tabBar setViewControllers:tabs];
    self.window.rootViewController=tabBar;
    [self.window makeKeyAndVisible];
    
<<<<<<< HEAD
    NSUserDefaults *user=[[NSUserDefaults alloc]init];
    
    [DataManager shared].userId=[user objectForKey:@"UserId"];
    if([DataManager shared].userId)
    {
        [DataManager shared].firstName=[user objectForKey:@"FirstName"];
        [DataManager shared].lastName=[user objectForKey:@"LastName"];
        [DataManager shared].email=[user objectForKey:@"Email"];
        [DataManager shared].password=[user objectForKey:@"Password"];
        
    }
    else{
   [self.mainNav presentViewController:navigation animated:YES completion:nil];
    }
 
    return YES;
}
-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    
    return viewController != tabBarController.selectedViewController;
}
=======
   [self.mainNav presentViewController:navigation animated:YES completion:nil];
    
 
    return YES;
}
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
-(void)didSelectCenterButton
{
    if([self.av isShown])
    {
        [self.av dismissAnimated:YES];
    }
    else{
    NSArray *items = @[
<<<<<<< HEAD
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"arrow"] title:@"Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"attachment"] title:@"Rank"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"cube"] title:@"Profile"],
                       
                       ];
    NSInteger numberOfOptions = 3;
=======
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"arrow"] title:@"Next"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"attachment"] title:@"Attach"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"block"] title:@"Cancel"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"bluetooth"] title:@"Bluetooth"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"cube"] title:@"Deliver"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"download"] title:@"Download"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"enter"] title:@"Enter"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"file"] title:@"Source Code"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"github"] title:@"Github"]
                       ];
    NSInteger numberOfOptions = 9;
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
    self.av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    self.av.delegate=self;
        [self.av showInViewController:self.mainNav center:CGPointMake(self.mainNav.view.bounds.size.width/2.f, self.mainNav.view.bounds.size.height/2.f)];
   
    }
}

<<<<<<< HEAD
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex
{
    NSString * userId=[DataManager shared].userId;
    
    if(([item.title isEqualToString:@"Photo"]||[item.title isEqualToString:@"Rank"])&&userId)
    {
        int type;
        if([item.title isEqualToString:@"Photo"]){
            type =1;}
        else{
                type=2;
        }
        
        if(self.mainNav.viewControllers.count>2)
        {
            if([self.mainNav.viewControllers[1] isKindOfClass:[RestaurantLandingController class]])
            {
                UINavigationController * nav= [[UINavigationController alloc] initWithRootViewController:[[FoodSelectorController alloc]initWithType:type andFoodItem:self.food andRestaurant:self.restaurant]];
                NSLog(@"Resturant photos");
                [self.mainNav presentViewController:nav animated:YES completion:nil];

            }
            else if([self.mainNav.viewControllers[0] isKindOfClass:[SearchController class]])
            {
                UINavigationController * nav= [[UINavigationController alloc] initWithRootViewController:[[SearchPhotoController alloc]initWithType:type]];
                [self.mainNav presentViewController:nav animated:YES completion:nil];

            }
        }
        else
        {
            if([self.mainNav.viewControllers[0] isKindOfClass:[SearchController class]])
            {
                
                UINavigationController * nav= [[UINavigationController alloc] initWithRootViewController:[[SearchPhotoController alloc]initWithType:type]];
                [self.mainNav presentViewController:nav animated:YES completion:nil];

            }

        }
    }
    
    else
    {
        if(![DataManager shared].userId)
        {
        LoginController * login=[[LoginController alloc]init];
        UINavigationController * navigation=[[UINavigationController alloc]initWithRootViewController:login];
        [self.mainNav presentViewController:navigation animated:YES completion:nil];
        }
        else{
            
            ProfileController *profile=[[ProfileController alloc]init];
            profile.delegate=self;
            UINavigationController * navigation=[[UINavigationController alloc]initWithRootViewController:profile];

            [self.mainNav presentViewController:navigation animated:YES completion:nil];

        }
        
        
        
    }
    [gridMenu dismissAnimated:YES];
}
-(void)didLogout:(id)sender
{
    ProfileController * profile=sender;
    [profile dismissViewControllerAnimated:YES completion:^{
        LoginController * login=[[LoginController alloc]init];
        UINavigationController * navigation=[[UINavigationController alloc]initWithRootViewController:login];
        [self.mainNav presentViewController:navigation animated:YES completion:nil];
    }];
}
-(void)gridMenuWillDismiss:(RNGridMenu *)gridMenu
{
    [gridMenu dismissAnimated:YES];
}
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Ripe" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Ripe.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
