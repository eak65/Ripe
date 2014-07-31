//
//  SignUpController.h
//  JASidePanels
//
//  Created by Ethan Keiser on 7/3/14.
//
//

#import <UIKit/UIKit.h>
#import "SignUpButtonCell.h"
#import "YCameraViewController.h"
#import "constants.h"
@protocol SignUpDelegate <NSObject>

-(void)SignUpDidCompleteSuccess;

@end
@interface SignUpController : UITableViewController <UITextFieldDelegate,SignUpButtonCellDelegate ,YCameraViewControllerDelegate>
@property(weak,nonatomic)id <SignUpDelegate>delegate;

@end
