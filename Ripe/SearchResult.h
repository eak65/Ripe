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
@property(nonatomic,strong) CLLocation *location;
@property(nonatomic, strong) NSMutableArray *photoReferences;
@property(nonatomic,strong)NSMutableArray * photoUrls;
@property(nonatomic, strong) NSString *address;
-(void)setPhotoUrls;

@end
