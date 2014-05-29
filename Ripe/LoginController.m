//
//  LoginController.m
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "SearchController.h"
#import "LoginController.h"
#import "SignUpController.h"

@interface LoginController ()

@end

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
    self.passwordField.delegate=self;
    self.userNameField.delegate=self;
    self.title=@"RIPE";
    [self getLocation];
    // Do any additional setup after loading the view from its nib.
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
    
    [self.navigationController pushViewController:signUp animated:YES];
    
    
    
}

- (IBAction)loginButton:(id)sender {
    
    SearchController * searchView=[[SearchController alloc]init];
    [self.userNameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.navigationController pushViewController:searchView animated:YES];
    
}
@end
