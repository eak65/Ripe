//
//  FoodSelectorController.h
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RATreeView.h"
#import "Menu.h"
#import "FoodItem.h"
@interface FoodSelectorController : UIViewController <RATreeViewDataSource,RATreeViewDelegate>
@property (strong, nonatomic) IBOutlet RATreeView *treeView;
@property(strong,nonatomic)NSMutableArray *menus;

@end
