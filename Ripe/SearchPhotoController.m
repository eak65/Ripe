//
//  SearchPhotoController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "SearchPhotoController.h"
#import "FoodSelectorController.h"
@interface SearchPhotoController ()
{
    int type;
}
@end

@implementation SearchPhotoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(id)initWithType:(int) t
{
    type=t;
    
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
  
        self.descriptionLabel.text=@"Search a restaurant.";
 
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [self.navigationController pushViewController:[[FoodSelectorController alloc]initWithType:type] animated:YES];
}

@end
