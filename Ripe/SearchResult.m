//
//  SearchResult.m
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "SearchResult.h"
#import <AFNetworking.h>
#import "constants.h"


@implementation SearchResult

-(id)init{
    self.photoReferences=[NSMutableArray array];
     self.photoUrls=[NSMutableArray array];
    return self;
}
-(void)setPhotoUrls
{

    for(NSString *reference in self.photoReferences)
    {
        [self.photoUrls addObject:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?photoreference=%@&sensor=true&key=%@&maxwidth=400",reference,kGOOGLE_API_KEY]]];
        
    }
    
}
@end
