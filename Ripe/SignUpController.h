//
//  SignUpController.h
//  Ripe
//
//  Created by Ethan Keiser on 5/20/14.
//  Copyright (c) 2014 Ethan Keiser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpController : UIViewController <UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
