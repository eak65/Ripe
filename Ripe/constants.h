//
//  constants.h
//  Ripe
//
//  Created by Ethan Keiser on 5/21/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#define kGOOGLE_API_KEY @"AIzaSyDA-c-FovemzEc4tuY4DAtBfq_G112bfrI"

#define KBaseUrl @"http://ripeapp.azurewebsites.net"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]