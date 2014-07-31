//
//  PhotoController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/19/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "PhotoController.h"

@interface PhotoController ()
{
    YCameraViewController *cameraView;
}
@end

@implementation PhotoController

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
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
