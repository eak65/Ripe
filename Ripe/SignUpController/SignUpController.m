//
//  SignUpController.m
//  JASidePanels
//
//  Created by Ethan Keiser on 7/3/14.
//
//

#import "SignUpController.h"
#import "SignUpCell.h"
#import "AFNetworking.h"
#import "constants.h"
#import "RadioButton.h"
#import "RadioButtonCell.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationManager.h"
#import "DoAlertView.h"

#import "SignUpPhotoTableViewCell.h"
@interface SignUpController ()
{
    NSMutableArray * options;
    DoAlertView * load ;
    UITapGestureRecognizer * gesture;
    UIImage * currentImage;
    UITextField *selected;
    NSString * firstname;
    NSString * lastName;

}

@end

@implementation SignUpController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    options =[NSMutableArray array];
    load=[[DoAlertView alloc]init];
    [options addObject:@""];
  [options addObject:@"Password"];
    [options addObject:@"Verify Password"];
    [options addObject:@"Email"];
    [options addObject:@"Email"];
    currentImage = [UIImage imageNamed:@"placeholder.png"];

    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignKeyboard)];
    [self.view addGestureRecognizer:tap];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBarHidden=NO;

}
- (void)didFinishPickingImage:(UIImage *)image
{
    currentImage=image;
    SignUpPhotoTableViewCell *photoCell= (SignUpPhotoTableViewCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    photoCell.profileImage.image= image;
    photoCell.firstName.text=firstname;
    photoCell.lastName.text=lastName;
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)profile{
    
    YCameraViewController * camera=[[YCameraViewController alloc]init];
    camera.delegate=self;
    SignUpPhotoTableViewCell *photoCell=(SignUpPhotoTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
   firstname= photoCell.firstName.text;
   lastName= photoCell.lastName.text;
    [self presentViewController:camera animated:YES completion:nil];
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(back)];

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return options.count+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier=@"CellId";
    static NSString * CellIdentifier2=@"CellId2";
    static NSString * CellIdentifier3=@"CellId3";

    SignUpCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[SignUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"SignUpCell" owner:nil options:nil];
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[SignUpCell class]])
            {
                cell=(SignUpCell *)currentObject;
                cell.rightField.delegate=self;
                cell.userInteractionEnabled =YES;
                break;
            }
        }
    }
    
    
        if(indexPath.row ==0)
        {
            SignUpPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
            
            
            if (cell == nil) {
                cell = [[SignUpPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
                NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"SignUpPhotoTableViewCell" owner:nil options:nil];
                for(id currentObject in topLevelObjects)
                {
                    if([currentObject isKindOfClass:[SignUpPhotoTableViewCell class]])
                    {
                        cell=(SignUpPhotoTableViewCell *)currentObject;
                        cell.firstName.delegate=self;
                        cell.lastName.delegate=self;
                     gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(profile)];
                        [cell.profileImage addGestureRecognizer:gesture];
                        cell.profileImage.userInteractionEnabled=YES;
                        cell.profileImage.image=currentImage;
                        cell.firstName.text=firstname;
                        cell.lastName.text=lastName;
                        break;
                    }
                }
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
            
         
        }
    
        else if(indexPath.row==(options.count ))
        {
            SignUpButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier3];
            
            
            if (cell == nil) {
                cell = [[SignUpButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"SignUpButtonCell" owner:self options:nil];
                for(id currentObject in topLevelObjects)
                {
                    if([currentObject isKindOfClass:[SignUpButtonCell class]])
                    {
                        cell=(SignUpButtonCell *)currentObject;
                        [cell.signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
                        break;
                    }
                }
            }
        
            cell.delegate=self;
         //   cell.signUpButton.layer.cornerRadius=10.0f;
        
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
        else{
            if(indexPath.row == 1||indexPath.row==2)
            {
                [cell.rightField setSecureTextEntry:YES];
            }
            cell.userInteractionEnabled=YES;
            if(indexPath.row==(options.count-1))
            {
                static NSString *cellR=@"radio";
                RadioButtonCell * radioCell =[self.tableView dequeueReusableCellWithIdentifier:cellR];
                
                
                if (radioCell == nil) {
                    radioCell = [[RadioButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellR];
                    NSArray *topLevelObjects=[[NSBundle mainBundle] loadNibNamed:@"RadioButtonCell" owner:nil options:nil];
                    for(id currentObject in topLevelObjects)
                    {
                        if([currentObject isKindOfClass:[RadioButtonCell class]])
                        {
                            radioCell=(RadioButtonCell *)currentObject;
                            radioCell.maleButton.groupButtons=@[radioCell.maleButton,radioCell.femaleButton];
                            [radioCell.maleButton setSelected:YES];
                            radioCell.maleButton.tag=0;
                            radioCell.femaleButton.tag=1;
                            break;
                        }
                    }
                }
                
                return radioCell;
            }
            else{
        cell.rightField.placeholder=[options objectAtIndex:indexPath.row];
            }
            
        }

    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    selected=textField;
   
    
}
-(void)resignKeyboard
{
    if(selected){
    [selected resignFirstResponder];
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        return 103.0f;
    }
    else {
        return 44.0f;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.

    
    if(indexPath.row>0&&indexPath.row<[self.tableView numberOfRowsInSection:0]-1)
    {
   SignUpCell *signup=(SignUpCell*) [self.tableView cellForRowAtIndexPath:indexPath];
        [signup.rightField becomeFirstResponder];
    }
   
}


-(void)didSelectSignUpButton:(id)sender
{
    CLLocation *location=[[LocationManager shared]getLocation];
    double x= location.coordinate.longitude;
    double y= location.coordinate.latitude;
    SignUpPhotoTableViewCell *photoCell=(SignUpPhotoTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    NSString * firstName =photoCell.firstName.text;
    NSString * lastName =photoCell.lastName.text;

    SignUpCell *passwordCell=(SignUpCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]];
    passwordCell.errorLabel.text=@"";
    
    NSString * passwordText=passwordCell.rightField.text;
    SignUpCell *passwordV=(SignUpCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0]];
    passwordV.errorLabel.text=@"";
    NSString * passwordVerify=passwordV.rightField.text;
SignUpCell *emailCell=(SignUpCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:3 inSection:0]];
    emailCell.errorLabel.text=@"";
    NSString * emailText=emailCell.rightField.text;
 RadioButtonCell * radioButton=(RadioButtonCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:4 inSection:0]];
    NSString *sex;
    RadioButton *selectedCell= radioButton.femaleButton.selectedButton;
    if(selectedCell.tag==0) // male selected
    {
        sex=@"m";
    }
    else // female selected
    {
        sex=@"f";
    }
    // user email password
    BOOL validated=YES;
    
    if(passwordText.length<3||passwordText.length>10)
    {
        validated=NO;
        passwordCell.errorLabel.text=@"Password must be greater than 3 and less than 10 characters.";
    }
    if(![passwordText isEqualToString:passwordVerify])
    {        validated=NO;

        passwordV.errorLabel.text=@"Passwords do not match.";
    }
   /* if(emailText.length==0||[emailText rangeOfString:@"@"].location >0|| ![emailText substringFromIndex:[emailText rangeOfString:@"@"].location].length>0)
    {        validated=NO;

        emailCell.errorLabel.text=@"Invalid email. Requires @ sign";
    }*/
    if(validated){
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:firstName,@"firstName",passwordText,@"password",emailText,@"email",lastName,@"lastName",sex,@"sex",[NSString stringWithFormat:@"POINT(%f %f)",x,y ],@"location", nil];
    
    [self CreateUser:dictionary];
    }
}

-(void)CreateUser:(NSDictionary *)dictionary
{
    NSURL *url=[NSURL URLWithString:KBaseUrl];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager manager]initWithBaseURL:url];
    
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    load.bDestructive=NO;
    [load doAlert:@"Registering" body:@"Submitting..." duration:0 done:^(DoAlertView *alertView) {
        
    }];
    [manager POST:@"/api/Login/PostSignUp" parameters:dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [load hideAlert];
     
        [self.delegate SignUpDidCompleteSuccess];

      
        
       
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
                [load hideAlert];
        DoAlertView * alert =[[DoAlertView alloc]init];
        
        alert.bDestructive=YES;
        if(  operation.response.statusCode ==409){
        [alert doYes:@"Email has already been taken" yes:^(DoAlertView *alertView) {
            
        }];
        }
        }];
    
}

@end
