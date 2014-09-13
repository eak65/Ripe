//
//  LoginController.h
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
<<<<<<< HEAD
#import "SignUpController.h"
@interface LoginController : UIViewController <SignUpDelegate,CLLocationManagerDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
=======
@interface LoginController : UIViewController <CLLocationManagerDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)skip:(id)sender;
- (IBAction)signUp:(id)sender;
@property (strong, nonatomic) CLLocationManager *locationManager;

- (IBAction)loginButton:(id)sender;
@end
