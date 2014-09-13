//
//  SearchResult.h
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "constants.h"
@interface SearchResult : NSObject
@property (nonatomic,strong)NSString * name;
<<<<<<< HEAD
@property(nonatomic,strong) NSString *has_menu;
@property(nonatomic, strong) NSMutableArray *resource_uri;
@property(nonatomic,strong)NSMutableArray * phone;
@property(nonatomic, strong) NSString *street_address;
@property(nonatomic, strong) NSString *id;
=======
@property(nonatomic,strong) CLLocation *location;
@property(nonatomic, strong) NSMutableArray *photoReferences;
@property(nonatomic,strong)NSMutableArray * photoUrls;
@property(nonatomic, strong) NSString *address;
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
-(void)setPhotoUrls;

@end
