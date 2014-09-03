//
//  RatingController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/18/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "DataManager.h"
#import "DoAlertView.h"
#import "RatingOptionController.h"
#import <AFNetworking.h>
#import "constants.h"
@interface RatingOptionController ()
{
    FoodItem * foodItem;
    NSString  *score;
}
@end

@implementation RatingOptionController

-(id)initWithFoodItem:(FoodItem *)food
{
    foodItem=food;
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *viewAr = [[NSBundle mainBundle] loadNibNamed:@"RatingCommentView" owner:self options:nil];
    UIView *popup = [viewAr objectAtIndex:0];
    self.navigationController.navigationBar.translucent=NO;
    popup.layer.cornerRadius = 5;
    popup.layer.masksToBounds = YES;
    self.textView.layer.cornerRadius=5;
    self.textView.layer.borderWidth = 1.0f;
    self.textView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.modal = [[RNBlurModalView alloc] initWithParentView:self.navigationController.view view:popup];

    [self.modal setContentViewCenter:CGPointMake(CGRectGetMidX(self.view.frame), 180)];
    
    // Do any additional setup after loading the view from its nib.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=nil;
    NSString *identifier=@"cellId";
    cell= [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil)
    {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    if(indexPath.row==0)
    {
        cell.textLabel.text=@"Awesome ";
        cell.imageView.image=[UIImage imageNamed:@"smileyface.jpeg"];
    }
    else if(indexPath.row==1)
    {
        cell.textLabel.text=@"GOOD ";
        cell.imageView.image=[UIImage imageNamed:@"smle.jpeg"];
        
    }
    else if(indexPath.row==2)
    {
        cell.textLabel.text=@"OK ";
        cell.imageView.image=[UIImage imageNamed:@"mean.jpeg"];
        
    }
    else if(indexPath.row==3)
    {
        
        cell.textLabel.text=@"Bad ";
        cell.imageView.image=[UIImage imageNamed:@"mean.jpeg"];
    }
    else if(indexPath.row ==4)
    {
        cell.textLabel.text=@"TERRIBLE ";
        cell.imageView.image=[UIImage imageNamed:@"mean.jpeg"];
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int scoretemp= (int)indexPath.row;
    scoretemp++;
    scoretemp=6-scoretemp;
    score= [NSString stringWithFormat:@"%d",scoretemp];;
    [self.modal show];
    
    self.view.hidden=NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postReviewButton:(id)sender {
    
    DoAlertView * alert=[[DoAlertView alloc] init];
    
    [alert doAlert:@"Posting" body:@"Submitting Review" duration:0.0 done:^(DoAlertView *alertView) {
        
    }];
    NSURL *url=[NSURL URLWithString:KBaseUrl];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]initWithBaseURL:url];
    NSDictionary * dict=[NSDictionary dictionaryWithObjectsAndKeys:[DataManager shared].userId,@"userId",foodItem.Id,@"foodItemId",self.textView.text,@"reviewText",score,@"score", nil];
    [manager POST:@"/api/FoodItem/PostReview" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [alert hideAlert];
        [self.modal hide];
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [alert hideAlert];
        [self.modal hide];
        alert.bDestructive=YES;
        [alert doYes:@"Error" yes:^(DoAlertView *alertView) {
            
        }];
    }];


}
@end
