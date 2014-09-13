//
//  SignUpPhotoTableViewCell.m
//  JASidePanels
//
//  Created by Ethan Keiser on 7/3/14.
//
//

#import "SignUpPhotoTableViewCell.h"

@implementation SignUpPhotoTableViewCell

- (void)awakeFromNib
{
    self.separatorImage.image=[UIImage imageNamed:@"tbSeprator.png"];
   // self.profileImage.layer.cornerRadius=10.0f;
   // self.profileImage.layer.borderWidth=1;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
