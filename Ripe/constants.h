//
//  constants.h
//  Ripe
//
//  Created by Ethan Keiser on 5/21/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

//AIzaSyAdewVeKvwaGcNcRqCEmZaJLdzqGIx-c3M
//AIzaSyDA-c-FovemzEc4tuY4DAtBfq_G112bfrI
#define kGOOGLE_API_KEY @"AIzaSyAdewVeKvwaGcNcRqCEmZaJLdzqGIx-c3M"
//http://ripeapp.azurewebsites.net
//"http://192.168.1.5:53456"
//"http://10.0.0.120:53456"

#define KBaseUrl @"http://10.0.0.120:53456"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]