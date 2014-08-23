//
//  FoodItem.h
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject
-(id)init;
@property(strong,nonatomic)NSString * Name;
@property(strong,nonatomic)NSString * Description;
@property(strong,nonatomic)NSString * Price;
@property(strong,nonatomic)NSString * Id;
@property(strong,nonatomic)NSString * MenuSectionId;
@property(strong,nonatomic)NSString * Type;
@property(strong,nonatomic)NSArray *Ratings;
@property(strong,nonatomic)NSArray *Photos;
@property(nonatomic)double rank;

@end
