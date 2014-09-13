//
//  Menu.m
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "Menu.h"

@implementation Menu
-(id)init
{
    self= [super init];
    
    [self setValue:@"FoodItem" forKeyPath:@"propertyArrayMap.foodItems"];

    return self;
}
@end
