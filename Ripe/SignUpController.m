//
//  SignUpController.m
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "SignUpButtonCell.h"
#import "AFNetworking.h"
#import "constants.h"
#import "SignUpController.h"
#import "SignUpCell.h"
#import "SearchController.h"
@interface SignUpController ()

@end

@implementation SignUpController

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
    self.navigationController.navigationBar.translucent=NO;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


-(NSInteger)registerUser
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SignUpCell *result = nil;
    static NSString *CellIdentifier = @"CellIdentifier";
    result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (result == nil){
        result = [[SignUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"SignUpCell" owner:nil options:nil];
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[SignUpCell class]])
            {
                result=(SignUpCell *)currentObject;
                result.textBoxField.delegate=self;
                break;
            }
        }
    }
    
    if(indexPath.row ==0)
    {
   result.textBoxField.placeholder=@"Name";
    }
    else if(indexPath.row==1)
    {
        result.textBoxField.placeholder=@"Username";

    }
    else if(indexPath.row==2)
    {
        result.textBoxField.placeholder=@"Email";
    }else if(indexPath.row==3)
    {
        result.textBoxField.placeholder=@"Password";
        
    }
    else if(indexPath.row==4)
    {
        result.textBoxField.placeholder=@"Verify Password";
    }
    else if(indexPath.row==5)
    {
         SignUpButtonCell *buttoncell = nil;
        static NSString *buttoncellID = @"buttoncell";
        buttoncell = [tableView dequeueReusableCellWithIdentifier:buttoncellID];
        if (buttoncell == nil){
            buttoncell = [[SignUpButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:buttoncellID];
            NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"SignUpButtonCell" owner:nil options:nil];
            for(id currentObject in topLevelObjects)
            {
                if([currentObject isKindOfClass:[SignUpButtonCell class]])
                {
                    buttoncell=(SignUpButtonCell *)currentObject;
                  
                    
                    break;
                }
            }
        }
        return buttoncell;

      
    }
    return result;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==5)
    {
    return 120;
    }
    else
    {
        return 44;
    }
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}




- (IBAction)registerButton:(id)sender {
    
    
    int result=(int)[self registerUser];
    if(result ==1)
    {
        NSMutableArray * result=[NSMutableArray array];
        for(int i =0;i<5;i++)
        {
            
            
            SignUpCell *cell=(SignUpCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:i inSection:1]];
            [result addObject:cell.textBoxField.text];
            
        }
        NSDictionary *dictionary =[NSDictionary dictionaryWithObjectsAndKeys:result[0],@"Username",result[1],@"Password",result[2],@"Email", nil];
        
        NSURL *url=[NSURL URLWithString:KBaseUrl];
        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]initWithBaseURL:url];
        
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        
        [manager POST:@"/api/Login/PostSignUp" parameters:dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    }
    else
    {
        
    }

}

@end
