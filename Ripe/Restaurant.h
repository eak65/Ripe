//
//  Restaurant.h
//  Ripe
//
//  Created by Ethan Keiser on 8/17/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appetizer.h"
#import "Drinks.h"
#import "Other.h"
#import "SoupSalad.h"
#import "Dessert.h"
#import "Entree.h"

@interface Restaurant : NSObject

@property(nonatomic,strong) NSString *googleId;
@property(nonatomic,strong) NSString *restaurantId;
@property(nonatomic,strong) NSString *Name;
@property(nonatomic,strong) Entree *Entree;
@property(nonatomic,strong) Drinks *Drink;
@property(nonatomic,strong) Other *Other;
@property(nonatomic,strong) SoupSalad *SoupSalad;
@property(nonatomic,strong) Dessert *Dessert;
@property(nonatomic,strong) Appetizer *Appetizer;


@end
