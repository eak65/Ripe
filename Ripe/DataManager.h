//
//  DataManager.h
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
+(DataManager *)shared;
@property(nonatomic, strong)NSString *userId;
@property(nonatomic, strong)NSString *userName;
@property(nonatomic, strong)NSString *email;
@property(nonatomic, strong)NSString *password;



@end
