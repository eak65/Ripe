//
//  LocationManager.h
//  JASidePanels
//
//  Created by Ethan Keiser on 5/27/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate>

{
    

}
+(LocationManager *) shared;
-(CLLocation *)getLocation;
@end
