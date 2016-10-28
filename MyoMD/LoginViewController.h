//
//  LoginViewController.h
//  MedEx
//
//  Created by Aryaman Sharda on 10/26/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *usernameField;
    IBOutlet UITextField *passwordField;
    
    IBOutlet UITextField *usernameFieldSU;
    IBOutlet UITextField *passwordFieldSU;
    IBOutlet UITextField *phoneFieldSU;
    
    
    IBOutlet UIButton *forgotPassword;
    
    IBOutlet UIButton *loginViewButton;
    IBOutlet UIButton *signUpViewButton;
    
    
    IBOutlet UIView *loginView;
    IBOutlet UIView *newAccountView;
    
}

@property(nonatomic) BOOL *showSignIn;

@end
