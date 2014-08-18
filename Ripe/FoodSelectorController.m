 //
//  FoodSelectorController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "PhotoController.h"
#import "FoodSelectorController.h"
#import "Restaurant.h"
#import "RatingOptionController.h"
#import <AFNetworking.h>
#import "SearchResult.h"
#import "SearchResult.h"
#import "constants.h"
#import "NSObject+ObjectMap.h"
#import "DoAlertView.h"
@interface FoodSelectorController ()
{
    int type;
    FoodItem * foodOption;
    SearchResult * searchResult;
}
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
-(id)initWithType:(int) t andSearchResult:(SearchResult *)result
{
    self.menus=[NSMutableArray array];
    searchResult=result;
      type=t;
    [self getLandingPage];
    return self;
}
-(id)initWithType:(int) t andFoodItem:(FoodItem *)food andRestaurant:(Restaurant *)rest
{
    self.menus=[NSMutableArray array];

    if(food)
    {
        foodOption=food;
        Menu * n =[[Menu alloc]init];
        n.name=@"Did you want this?";
        n.foodItems=[NSMutableArray array];
        [n.foodItems addObject:food];
        [self.menus addObject:n];
       
    }
    if(rest)
    {
        [self.menus addObject:rest.Appetizer];
        [self.menus addObject:rest.Drink];
        [self.menus addObject:rest.SoupSalad];
        [self.menus addObject:rest.Dessert];
        [self.menus addObject:rest.Entree];
        [self.menus addObject:rest.Other];

    }
    type=t;
    
    return self;
}
- (BOOL)treeView:(RATreeView *)treeView shouldItemBeExpandedAfterDataReload:(id)item treeDepthLevel:(NSInteger)treeDepthLevel
{
    if(foodOption)
    {
        if([item isKindOfClass:[Menu class]])
        {
            Menu *m=item;
            
            if(m.foodItems.count>0&& [[m.foodItems objectAtIndex:0] isEqual:foodOption])
            {
                return YES;
            }
        }
    }
    return NO;
}
- (BOOL)treeView:(RATreeView *)treeView shouldExpandRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return  YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.menus=[NSMutableArray array];
    self.treeView.delegate=self;
    self.treeView.dataSource=self;
      self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];

    if(type==1)
    {
        self.descriptionLabel.text=@"Select the food item you would like to photograph.";
       
    }
    else{
         self.descriptionLabel.text=@"Select the food item you would like to rate.";

    }
    [self.treeView reloadData];
    // Do any additional setup after loading the view from its nib.
}

-(void)loadMenu
{
    
    // load the menu
    Menu * n =[[Menu alloc]init];
  //  n.menuName=@"Entree";
    
    FoodItem *food =[[FoodItem alloc] init];
    //food.Name=@"pizza";
    [n.foodItems addObject:food];
    
    [self.menus addObject:n];
    [self.treeView reloadData];
    
    
}
-(void)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    if([item isKindOfClass:[FoodItem class]])
    {
        if(type ==1)
        {
            [self.navigationController pushViewController:[[PhotoController alloc]init] animated:YES];

        }
     else if(type==2)
     {
         [self.navigationController pushViewController:[[RatingOptionController alloc]init] animated:YES];
     }
    }
    
}


- (NSInteger)treeView:(RATreeView *)treeView indentationLevelForRowForItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return 3 * treeNodeInfo.treeDepthLevel;
}

- (BOOL)treeView:(RATreeView *)treeView shouldExpandItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    return YES;
}


- (void)treeView:(RATreeView *)treeView willDisplayCell:(UITableViewCell *)cell forItem:(id)item treeNodeInfo:(RATreeNodeInfo *)treeNodeInfo
{
    if (treeNodeInfo.treeDepthLevel == 0) {
        cell.backgroundColor = UIColorFromRGB(0xF7F7F7);
    } else if (treeNodeInfo.treeDepthLevel == 1) {
        cell.backgroundColor = UIColorFromRGB(0xBAFAD0);
    } else if (treeNodeInfo.treeDepthLevel == 2) {
        cell.backgroundColor = UIColorFromRGB(0xE0F8D8);
    }
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
        cell.textLabel.text=menu.name;
    }
    else{
        FoodItem *foodItem=item;
        cell.textLabel.text=foodItem.Name;
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

-(void)getLandingPage
{
    DoAlertView * alert=[[DoAlertView alloc]init];
    alert.nAnimationType=3;
    [alert doAlert:@"Searching" body:@"Searching..." duration:0.0 done:^(DoAlertView *alertView) {
        
    }];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]initWithBaseURL:[NSURL URLWithString:KBaseUrl]];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    NSDictionary *parameters=[NSDictionary dictionaryWithObjectsAndKeys:searchResult.id,@"googleId",searchResult.name,@"name",[NSString stringWithFormat:@"%f",searchResult.location.coordinate.latitude ],@"lat",[NSString stringWithFormat:@"%f",searchResult.location.coordinate.longitude],@"lon", nil];
    [manager GET:@"/api/Restaurant/GetRestaurantFromGoogle" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [alert hideAlert];
        if(operation.response.statusCode==204)
        {
            DoAlertView *valert=[[DoAlertView alloc]init];
            [valert doYes:@"Not Registered" body:@"Sorry this restaurant is not registerd with our service" yes:^(DoAlertView *alertView) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }
        else{
            NSError *error;
            NSData *dataFromDict = [NSJSONSerialization dataWithJSONObject:responseObject
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
            
          Restaurant *  rest=[[Restaurant alloc] initWithJSONData:dataFromDict];
            [self.menus addObject:rest.Appetizer];
            [self.menus addObject:rest.Drink];
            [self.menus addObject:rest.SoupSalad];
            [self.menus addObject:rest.Dessert];
            [self.menus addObject:rest.Entree];
            [self.menus addObject:rest.Other];

            [self.treeView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [alert hideAlert];
    }];
    
}
@end
