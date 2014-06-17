//
//  Menu.h
//  Ripe
//
//  Created by Ethan Keiser on 6/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Menu : NSObject
@property(strong,nonatomic)NSString * menuName;
@property(strong,nonatomic)NSString * menuId;

@property(strong,nonatomic)NSMutableArray *foodItems;
@end
