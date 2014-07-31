//
//  SignUpButtonCell.m
//  JASidePanels
//
//  Created by Ethan Keiser on 7/3/14.
//
//

#import "SignUpButtonCell.h"

@implementation SignUpButtonCell
NSString * text;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier buttonText:(NSString *)t
{
    id a=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    text=t;
    
    return a;
}
- (void)awakeFromNib
{
//    self.signUpButton.titleLabel.text=text;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)signUpButton:(id)sender {
    [self.delegate didSelectSignUpButton:self];
}
@end
