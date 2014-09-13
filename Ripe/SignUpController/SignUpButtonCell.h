//
//  SignUpButtonCell.h
//  JASidePanels
//
//  Created by Ethan Keiser on 7/3/14.
//
//

#import <UIKit/UIKit.h>
@protocol SignUpButtonCellDelegate

-(void)didSelectSignUpButton:(id)sender;
@end
@interface SignUpButtonCell : UITableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier buttonText:(NSString *)text;
@property(weak,nonatomic) id <SignUpButtonCellDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIButton *signUpButton;
- (IBAction)signUpButton:(id)sender;

@end
