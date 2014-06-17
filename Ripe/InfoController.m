//
//  InfoController.m
//  Ripe
//
//  Created by Ethan Keiser on 6/5/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "InfoController.h"

@interface InfoController ()
{
    UIView *presentView;
}
@end

@implementation InfoController

-(id)initWithView:(UIView *)backView
{
    presentView = backView;
    return  self;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)infoBackButton:(id)sender {
    
 
   [UIView transitionFromView:self.view toView:presentView duration:0.75 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
    
    
    
}
@end