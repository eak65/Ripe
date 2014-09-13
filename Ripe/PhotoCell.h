//
//  PhotoCell.h
//  Ripe
//
//  Created by Ethan Keiser on 9/13/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
@interface PhotoCell : UITableViewCell
-(id)initWithCellId:(NSString *)cellId;
-(void)setPhoto:(Photo *)photo;
@property (strong, nonatomic) IBOutlet UIImageView *photoImage;

@end
