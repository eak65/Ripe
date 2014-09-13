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
<<<<<<< HEAD
  // self.photoReferences=[NSMutableArray array];
   // self.photoUrls=[NSMutableArray array];
=======
    self.photoReferences=[NSMutableArray array];
     self.photoUrls=[NSMutableArray array];
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
    return self;
}
-(void)setPhotoUrls
{

<<<<<<< HEAD
   // for(NSString *reference in self.photoReferences)
    //{
      //  [self.photoUrls addObject:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?photoreference=%@&sensor=true&key=%@&maxwidth=400",reference,kGOOGLE_API_KEY]]];
        
    //}
=======
    for(NSString *reference in self.photoReferences)
    {
        [self.photoUrls addObject:[NSURL URLWithString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?photoreference=%@&sensor=true&key=%@&maxwidth=400",reference,kGOOGLE_API_KEY]]];
        
    }
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
    
}
@end
