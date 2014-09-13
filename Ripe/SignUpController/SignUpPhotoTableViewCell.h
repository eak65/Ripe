//
//  SignUpPhotoTableViewCell.h
//  JASidePanels
//
//  Created by Ethan Keiser on 7/3/14.
//
//

#import <UIKit/UIKit.h>
#import <NZCircularImageView.h>

@interface SignUpPhotoTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet NZCircularImageView *separatorImage;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@end
