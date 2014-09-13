//
//  PhotoCell.m
//  Ripe
//
//  Created by Ethan Keiser on 9/13/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "PhotoCell.h"
#import "Photo.h"
@implementation PhotoCell
-(id)initWithCellId:(NSString *)cellId
{
    self = [[PhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"PhotoCell" owner:nil options:nil];
    for(id currentObject in topLevelObjects)
    {
        if([currentObject isKindOfClass:[PhotoCell class]])
        {
            self=(PhotoCell *)currentObject;
            break;
        }
    }
    
    return self;
}
-(void)setPhoto:(Photo *)photo
{
    
    NSURL *url = [NSURL URLWithString:photo.URI];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    self.photoImage.image=img;
    
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
