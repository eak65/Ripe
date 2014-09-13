//
//  TableViewController.h
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingViewController : UITableViewController
@property(nonatomic,strong)NSString * style;
@property(nonatomic,strong)NSMutableArray * dataArray;
-(id)initWithArray:(NSMutableArray *)dArray andParentView:(UIView *)parentView;

-(void)setSource:(NSString *)src;
@end
