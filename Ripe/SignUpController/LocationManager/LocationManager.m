//
//  LocationManager.m
//  JASidePanels
//
//  Created by Ethan Keiser on 5/27/14.
//
//

#import "LocationManager.h"

@implementation LocationManager
static LocationManager *locationManager;
CLLocationManager *clLocationManager;
+(LocationManager *) shared{
    if(!locationManager){
        
        locationManager = [[LocationManager alloc]init];
        clLocationManager = [[CLLocationManager alloc ]init];
        [clLocationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        [clLocationManager setDelegate:self];
        [clLocationManager startUpdatingLocation];
        
    }
    
    return locationManager;
}




-(CLLocation *)getLocation{
    

    CLLocation *location =clLocationManager.location;
    return location;
    
   
}

@end
