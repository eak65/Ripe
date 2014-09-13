//
//  SearchController.m
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import "SearchResult.h"
#import "AFnetworking.h"
<<<<<<< HEAD
#import "NSObject+ObjectMap.h"
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
#import "SearchController.h"
#import "DoAlertView.h"
#import "RestaurantLandingController.h"
@interface SearchController ()

@end

@implementation SearchController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar                  // called when keyboard search button pressed
{
    [self queryGooglePlaces:searchBar.text];
    [self.searchBar resignFirstResponder];

}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText  // called when text changes (including
{
    /*
    float longitude= self.location.coordinate.longitude;
    float latitude= self.location.coordinate.latitude;
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]init];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
        NSDictionary *parameters ;
    if(self.location){

       parameters = [NSDictionary dictionaryWithObjectsAndKeys:searchText,@"input",@"true",@"sensor",kGOOGLE_API_KEY,@"key",@"5000",@"radius",[NSString stringWithFormat:@"%f,%f",latitude,longitude],@"location",@"restaurant|food",@"types",nil];
    }
    else{
        
        parameters = [NSDictionary dictionaryWithObjectsAndKeys:searchText,@"input",@"true",@"sensor",kGOOGLE_API_KEY,@"key",@"restaurant|food",@"types",nil];
    }
    
    NSString *url=@"https://maps.googleapis.com/maps/api/place/textsearch/json";
    
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * r = responseObject;
        [r objectForKey:@"predictions"];
        NSLog(@"%@",r);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
     */
}

-(void)getLocation
{
    [[self locationManager] startUpdatingLocation];
    self.location = _locationManager.location;
    [[self locationManager] stopUpdatingLocation];
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.placeholder=@"Parc or Parc in Philadelphia";
    self.title=@"Search";
<<<<<<< HEAD
    self.navigationController.navigationBar.translucent=NO;
    UITapGestureRecognizer * gestureRecognizer =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backTouch)];
   // [self.view addGestureRecognizer:gestureRecognizer];
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
    [self getLocation];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.totalSearchResult=[NSMutableArray array];
    NSArray *viewAr = [[NSBundle mainBundle] loadNibNamed:@"SearchResultView" owner:self options:nil];
    UIView *popup = [viewAr objectAtIndex:0];
<<<<<<< HEAD
    
    popup.layer.borderColor = [UIColor greenColor].CGColor;
    popup.layer.borderWidth = 3.0f;
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
    self.modal = [[RNBlurModalView alloc] initWithParentView:self.view view:popup];

    
}
<<<<<<< HEAD

-(void)backTouch{
    
    //[self.searchBar resignFirstResponder];
}
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
- (CLLocationManager *)locationManager {
    if (_locationManager != nil) {
        return _locationManager;
    }
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    [_locationManager setDelegate:self];
    
    return _locationManager;
}

#pragma places
-(void) queryGooglePlaces: (NSString *) searchText {

    
   
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]init];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];


    NSDictionary *parameters ;
    NSString * url;
    if(self.location)// do a nearby Search
    {
       float longitude= self.location.coordinate.longitude;
        float latitude= self.location.coordinate.latitude;

<<<<<<< HEAD
           parameters = [NSDictionary dictionaryWithObjectsAndKeys:searchText,@"name",kLocu_API_KEY,@"api_key",nil];
    }
    else{ // nolocation search
        parameters = [NSDictionary dictionaryWithObjectsAndKeys:searchText,@"name",kLocu_API_KEY,@"api_key",nil];
        
    }
    url=@"https://api.locu.com/v1_0/venue/search/";
=======
          parameters = [NSDictionary dictionaryWithObjectsAndKeys:searchText,@"query",@"true",@"sensor",kGOOGLE_API_KEY,@"key",@"5000",@"radius",[NSString stringWithFormat:@"%f,%f",latitude,longitude],@"location",@"restaurant|food",@"types",nil];
    }
    else{ // nolocation search
        parameters = [NSDictionary dictionaryWithObjectsAndKeys:searchText,@"query",@"false",@"sensor",kGOOGLE_API_KEY,@"key",@"restaurant|food",@"types",nil];
        
    }
    url=@"https://maps.googleapis.com/maps/api/place/textsearch/json";
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
    DoAlertView * alert=[[DoAlertView alloc]init];
    alert.nAnimationType=3;
    [alert doAlert:@"Searching" body:@"Searching..." duration:0.0 done:^(DoAlertView *alertView) {
        
    }];

    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
<<<<<<< HEAD
        NSLog(@"%@",operation.request.URL);
        
        NSDictionary *r = responseObject;
        NSArray *results =[r objectForKey:@"objects"];
=======
        
        
        NSDictionary *r = responseObject;
        NSArray *results =[r objectForKey:@"results"];
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
        [self.totalSearchResult removeAllObjects];
        SearchResult *searchResult;
        for(NSDictionary *dict in results)
        {
            NSLog(@"%@",dict);
<<<<<<< HEAD
            NSError *error;
            NSData *dataFromDict = [NSJSONSerialization dataWithJSONObject:dict
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&error];

            
        //    double latitude=[[[[dict objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"] doubleValue];
        //    double longitude=[[[[dict objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"] doubleValue];
            searchResult=[[SearchResult alloc]initWithJSONData:dataFromDict];

      //      searchResult.location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
           // searchResult.address=[dict objectForKey:@"formatted_address"];
           // searchResult.name=[dict objectForKey:@"name"];
     /*       NSArray * array=[NSArray arrayWithArray:[dict objectForKey:@"photos"]];
=======
            double latitude=[[[[dict objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"] doubleValue];
            double longitude=[[[[dict objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"] doubleValue];
            searchResult=[[SearchResult alloc]init];
            searchResult.location=[[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
            
            searchResult.address=[dict objectForKey:@"formatted_address"];
            searchResult.name=[dict objectForKey:@"name"];
            NSArray * array=[NSArray arrayWithArray:[dict objectForKey:@"photos"]];
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
           
                for(NSDictionary *ph in array)
                {
                    [searchResult.photoReferences addObject:[ph objectForKey:@"photo_reference"]];

                }
<<<<<<< HEAD
      */
=======
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
            
            [self.totalSearchResult addObject:searchResult];
        }
        
        [self.tableView reloadData];
        
        [self showResults];
    
    
        [alert hideAlert];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
<<<<<<< HEAD
        [alert hideAlert];

=======
          
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5
      }];
    
  
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *result = nil;
    static NSString *CellIdentifier = @"CellIdentifier";
    result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (result == nil){
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                        reuseIdentifier:CellIdentifier];
    }
    
    SearchResult * searchResult=[self.totalSearchResult objectAtIndex:indexPath.row];
    
    result.textLabel.text=searchResult.name;
<<<<<<< HEAD
    result.detailTextLabel.text=searchResult.street_address;
=======
    result.detailTextLabel.text=searchResult.address;
>>>>>>> 0af9b84bf3dd249f73c86734ff9ddda3a61be4c5

    
    return result;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.totalSearchResult count];
}

-(void)showResults
{
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:NO];
     [self.modal show];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.modal hide];
    RestaurantLandingController *restaurant=[[RestaurantLandingController alloc]initWithSearchResult:[self.totalSearchResult objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:restaurant animated:YES];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
