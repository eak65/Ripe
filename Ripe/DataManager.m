//
//  DataManager.m
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
static DataManager * dataManager;

+(DataManager *)shared
{
    if(dataManager==nil)
    {
        dataManager = [[DataManager alloc]init];
        
    }
    return dataManager;
    
}
@end
