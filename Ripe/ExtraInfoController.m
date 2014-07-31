//
//  ExtraInfoController.m
//  Ripe
//
//  Created by Ethan Keiser on 7/21/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import "ExtraInfoController.h"

@interface ExtraInfoController ()

@end

@implementation ExtraInfoController

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
 
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    // Do any additional setup after loading the view from its nib.
}

-(void)back
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
