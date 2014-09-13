//
//  ProfilePhotosController.m
//  Ripe
//
//  Created by Ethan Keiser on 9/13/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "DataManager.h"
#import <AFNetworking.h>
#import "constants.h"
#import "ProfilePhotosController.h"
#import "PhotoCell.h"
@interface ProfilePhotosController ()
{
    NSMutableArray * photos;
}
@end

@implementation ProfilePhotosController

- (void)viewDidLoad
{
    [super viewDidLoad];
    photos =[NSMutableArray array];
    
    [self getPhotos];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getPhotos
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]initWithBaseURL:[NSURL URLWithString:KBaseUrl]];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
    [manager GET:@"/api/Photo/GetPhotos" parameters:[NSDictionary dictionaryWithObjectsAndKeys:[DataManager shared].userId, @"userId", nil] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        [photos removeAllObjects];
        for(NSDictionary *dict in responseObject)
        {
            NSLog(@"%@",dict);
            NSError *error;
            NSData *dataFromDict = [NSJSONSerialization dataWithJSONObject:dict
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];
            [photos addObject:[[Photo alloc] initWithJSONData:dataFromDict]];
            
            
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"CellId";
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];

    
    if(cell ==nil)
    {
        cell =[[PhotoCell alloc] initWithCellId:cellId];
    }
    
    [cell setPhoto:[photos objectAtIndex:indexPath.row]];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
