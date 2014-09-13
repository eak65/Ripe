//
//  PhotoController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/19/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//
#import <AFNetworking.h>
#import "DataManager.h"
#import "PhotoController.h"
#import "constants.h"

@interface PhotoController ()
{
    YCameraViewController *cameraView;
    FoodItem * foodItem;
}
@end

@implementation PhotoController
-(id)initWithFoodItem:(FoodItem *)item
{
    foodItem=item;
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    cameraView=[[YCameraViewController alloc]init];
    cameraView.delegate=self;
    self.navigationController.navigationBar.translucent=NO;
    [self.navigationController presentViewController:cameraView animated:YES completion:nil];

    // Do any additional setup after loading the view from its nib.
}
-(void)didFinishPickingImage:(UIImage *)image
{
    self.foodImage.image=image;
}
- (void)yCameraControllerDidCancel
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)yCameraControllerdidSkipped
{
[self.navigationController popViewControllerAnimated:NO];

}
-(void)viewDidAppear:(BOOL)animated
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    
    [self postimage:self.foodImage.image];
 //   [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *nImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return nImage;
}

-(void)postimage:(UIImage *)newIage
{
    if(newIage)
    {
        
        NSURL *url=[NSURL URLWithString:KBaseUrl];
    
        UIImage *image =  [self imageWithImage:newIage scaledToSize:CGSizeMake(100, 100)];
        
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);

        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]initWithBaseURL:url];
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:[foodItem.Id stringValue] forHTTPHeaderField:@"foodId"];
        [manager.requestSerializer setValue:[[DataManager shared].userId stringValue] forHTTPHeaderField:@"userId"];
        
        [SVProgressHUD showWithStatus:@"Saving"];
        [manager POST:@"/api/Photo/PostPhoto" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {

            [formData appendPartWithFileData:imageData name:@"test" fileName:@"test" mimeType:@"image/png"];

            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"Success: %@", responseObject);
            [SVProgressHUD showSuccessWithStatus:@"Saved"];
            [self dismissViewControllerAnimated:YES completion:nil];

            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [SVProgressHUD showErrorWithStatus:@"Error"];
        }];
        
    }
    else{
        
    }
    
    
    
}
@end
