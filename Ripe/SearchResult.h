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
@property(nonatomic,strong) NSString *has_menu;
@property(nonatomic, strong) NSMutableArray *resource_uri;
@property(nonatomic,strong)NSMutableArray * phone;
@property(nonatomic, strong) NSString *street_address;
@property(nonatomic, strong) NSString *id;
-(void)setPhotoUrls;

@end
