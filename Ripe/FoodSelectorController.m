//
//  FoodSelectorController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "FoodSelectorController.h"

@interface FoodSelectorController ()

@end

@implementation FoodSelectorController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menus=[NSMutableArray array];
    self.treeView.delegate=self;
    self.treeView.dataSource=self;
    [self loadMenu];

    // Do any additional setup after loading the view from its nib.
}

-(void)loadMenu
{
    
    // load the menu
    Menu * n =[[Menu alloc]init];
    n.menuName=@"Entree";
    
    FoodItem *food =[[FoodItem alloc] init];
    food.foodName=@"pizza";
    [n.foodItems addObject:food];
    
    [self.menus addObject:n];
    [self.treeView reloadData];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    if(item ==nil){
    return self.menus.count;
    }
    else if([item isKindOfClass:[Menu class]]){
        Menu *menu=item;
       return menu.foodItems.count;
    }
    else{
        return 0;
    }
}
- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
     UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    if([item isKindOfClass:[Menu class]])
    {
        Menu * menu=item;
        cell.textLabel.text=menu.menuName;
    }
    else{
        FoodItem *foodItem=item;
        cell.textLabel.text=foodItem.foodName;
    }
    return cell;
    
}
- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    Menu *menu=item;
    if(item ==nil)
    {
     return   [self.menus objectAtIndex:index];
    }
    else
    {
       return [menu.foodItems objectAtIndex:index];
    }
    
}
@end
