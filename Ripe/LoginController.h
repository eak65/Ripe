//
//  LoginController.h
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface LoginController : UIViewController <CLLocationManagerDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)skip:(id)sender;
- (IBAction)signUp:(id)sender;
@property (strong, nonatomic) CLLocationManager *locationManager;

- (IBAction)loginButton:(id)sender;
@end
