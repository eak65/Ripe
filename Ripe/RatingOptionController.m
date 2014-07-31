//
//  RatingController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/18/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "RatingOptionController.h"

@interface RatingOptionController ()

@end

@implementation RatingOptionController

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
        cell.textLabel.text=@"Awesome SHIT";
        cell.imageView.image=[UIImage imageNamed:@"smileyface.jpeg"];
    }
    else if(indexPath.row==1)
    {
        cell.textLabel.text=@"GOOD SHIT";
        cell.imageView.image=[UIImage imageNamed:@"smle.jpeg"];
        
    }
    else if(indexPath.row==2)
    {
        cell.textLabel.text=@"OK SHIT";
        cell.imageView.image=[UIImage imageNamed:@"mean.jpeg"];
        
    }
    else if(indexPath.row==3)
    {
        
        cell.textLabel.text=@"Bad SHIT";
        cell.imageView.image=[UIImage imageNamed:@"mean.jpeg"];
    }
    else if(indexPath.row ==4)
    {
        cell.textLabel.text=@"TERRIBLE SHIT";
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
    [self.modal show];
    self.view.hidden=NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postReviewButton:(id)sender {

    [self.modal hide];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
