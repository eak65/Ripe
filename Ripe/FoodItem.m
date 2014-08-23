//
//  FoodItem.m
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem
-(id)init{

   self= [super init];
    [self setValue:@"Rating" forKeyPath:@"propertyArrayMap.Ratings"];
    [self setValue:@"Photos" forKeyPath:@"propertyArrayMap.Photos"];

    return self;
}
@end
