//
//  TableViewController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "Rating.h"
#import "RatingCell.h"
#import "RatingViewController.h"
#import "ReviewCell.h"
@interface RatingViewController ()
{
    NSMutableArray * ratingArray;
    NSMutableArray * reviewArray;
}
@end

@implementation RatingViewController


-(id)initWithArray:(NSMutableArray *)dArray andParentView:(UIView *)parentView;
{
    ratingArray=[NSMutableArray array];
    reviewArray=[NSMutableArray array];

    for(Rating * rating in dArray)
    {
        if([rating.Review isEqualToString:@""]||rating.Review==nil)
        {
            [ratingArray addObject:rating];
        }
        else
        {
            [reviewArray addObject:rating];
            [ratingArray addObject:rating];
        }
    }
    [self.view setFrame:parentView.bounds];
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(void)setSource:(NSString *)src
{
    self.style=src;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    self.tableView.backgroundColor=[UIColor clearColor];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if([self.style intValue]==1)
    return reviewArray.count;
    else
        return ratingArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if([self.style intValue]==1)
    {
    static NSString *CellIdentifier = @"CellIdReview";
    
    
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ReviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"ReviewCell" owner:nil options:nil];
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[ReviewCell class]])
            {
                cell=(ReviewCell *)currentObject;
                break;
            }
        }
    }
     Rating *rating=   [reviewArray objectAtIndex:indexPath.row];

    cell.commentTextView.layer.cornerRadius=5.0;
    cell.commentTextView.layer.borderColor=[[UIColor grayColor] CGColor];
    cell.commentTextView.layer.borderWidth=2.0;
    cell.commentTextView.userInteractionEnabled=NO;
    cell.ratingImage.userInteractionEnabled=NO;
        cell.commentTextView.text=rating.Review;
    
    cell.userNameLabel.userInteractionEnabled=NO;
    cell.dateLabel.userInteractionEnabled=NO;
    cell.ratingImage.image=[UIImage imageNamed:@"mean.jpeg"];
    cell.dateLabel.text=[NSString stringWithFormat:@"%@",[NSDate date] ];
        cell.userNameLabel.text=rating.User.FirstName;
        cell.score.text=[NSString stringWithFormat:@"%d",[rating.Score intValue]];

    cell.profileImage.image=[UIImage imageNamed:@"me.jpg"];
    
    return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"CellIdRating";
        
        
        RatingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[RatingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"RatingCell" owner:nil options:nil];
            for(id currentObject in topLevelObjects)
            {
                if([currentObject isKindOfClass:[RatingCell class]])
                {
                    cell=(RatingCell *)currentObject;
                    break;
                }
            }
        }
        
        Rating * rating=[ratingArray objectAtIndex:indexPath.row];
        cell.score.text=[rating.Score stringValue];
        
        return cell;
        
    }

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 if([self.style intValue]==1)
        return 160;
 else{
     return 44;
 }
    
       
    
}
@end
