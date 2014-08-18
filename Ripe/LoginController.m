//
//  LoginController.m
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "AFNetworking.h"
#import "SearchController.h"
#import "LoginController.h"
#import "DataManager.h"
#import "constants.h"
#import "DoAlertView.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"
@interface LoginController ()

@end
DoAlertView * alertView;
@implementation LoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;
    self.passwordField.delegate=self;
    self.passwordField.secureTextEntry=YES;
    self.userNameField.delegate=self;
    self.title=@"RIPE";
    [self getLocation];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName
           value:@"Login Screen"];
    
    // Previous V3 SDK versions
    // [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    // New SDK versions
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}
-(CLLocation *)getLocation
{
    [[self locationManager] startUpdatingLocation];
    CLLocation * location = _locationManager.location;
    [[self locationManager] stopUpdatingLocation];
    return location;
}
- (CLLocationManager *)locationManager {
    if (_locationManager != nil) {
        return _locationManager;
    }
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    [_locationManager setDelegate:self];
    
    return _locationManager;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skip:(id)sender {
    
    
    
    SearchController * searchView=[[SearchController alloc]init];
    [self.userNameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signUp:(id)sender {
    
    SignUpController * signUp=[[SignUpController alloc]init];
    signUp.delegate=self;
    
    [self.navigationController pushViewController:signUp animated:YES];
    
    
    
}

- (IBAction)loginButton:(id)sender {
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:self.passwordField.text,@"password",self.userNameField.text,@"email", nil];
    [self.userNameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    NSURL *url = [NSURL URLWithString:KBaseUrl];
    

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager] initWithBaseURL:url];
    
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    
    self.loginButton.enabled=NO;
    self.loginButton.userInteractionEnabled=NO;
    [manager PUT:@"api/Login/PutLogin"  parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.loginButton.enabled=YES;
        self.loginButton.userInteractionEnabled=YES;
        NSLog(@"%@",responseObject);
        [DataManager shared].userId=[responseObject objectForKey:@"UserId"];
        [DataManager shared].firstName=[responseObject objectForKey:@"FirstName"];
        [DataManager shared].lastName=[responseObject objectForKey:@"LastName"];

        [DataManager shared].email=[responseObject objectForKey:@"Email"];
        [DataManager shared].password = [responseObject objectForKey:@"Password"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        self.loginButton.enabled=YES;
        self.loginButton.userInteractionEnabled=YES;
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Login" message:@"Invalid username or password" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [alert show];
        
    }];
    
}
-(void)SignUpDidCompleteSuccess
{
    [self.navigationController popToRootViewControllerAnimated:YES];

//    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Email Sent!" message:@"Please confirm your  email" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    
 //   [alert show];
}
@end
