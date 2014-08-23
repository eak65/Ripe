//
//  Rating.h
//  Ripe
//
//  Created by Ethan Keiser on 8/18/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "User.h"
#import <Foundation/Foundation.h>

@interface Rating : NSObject
@property(nonatomic,strong)NSString * Review;
@property(nonatomic,strong)NSNumber * Score;
@property(nonatomic,strong)NSNumber * FoodItemId;
@property(nonatomic,strong)User* User;

@end
