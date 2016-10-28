//
//  LoginViewController.m
//  MedEx
//
//  Created by Aryaman Sharda on 10/26/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([PFUser currentUser]) {
        [self performSegueWithIdentifier:@"loginSuccessful" sender:self];
    }
    
    if (_showSignIn) {
        [self showLogin];
    } else {
        [self showNewAccount];
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-social-image.png"]];
    
    usernameField.delegate = self;
    passwordField.delegate = self;
    usernameFieldSU.delegate = self;
    passwordFieldSU.delegate = self;
    phoneFieldSU.delegate = self;
    
    usernameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter your email" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:(197/255.0) green:(208/255.0) blue:(222/255.0) alpha:1]}];
    
    passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter your password" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:(197/255.0) green:(208/255.0) blue:(222/255.0) alpha:1]}];
    
    usernameFieldSU.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter your email" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:(197/255.0) green:(208/255.0) blue:(222/255.0) alpha:1]}];
    
    passwordFieldSU.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter your password" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:(197/255.0) green:(208/255.0) blue:(222/255.0) alpha:1]}];
    
    phoneFieldSU.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter your phone number" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:(197/255.0) green:(208/255.0) blue:(222/255.0) alpha:1]}];
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:tapGesture];
    
}

-(IBAction)showNewAccount {
    [loginViewButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [signUpViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [loginView setHidden:YES];
    [newAccountView setHidden:NO];
}

-(IBAction)showLogin {
    [loginViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signUpViewButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [loginView setHidden:NO];
    [newAccountView setHidden:YES];
}

- (IBAction)login
{
    if (([usernameField.text length] != 0) && ([passwordField.text length] != 0))
    {
        [PFUser logInWithUsernameInBackground:usernameField.text password:passwordField.text
                                        block:^(PFUser *user, NSError *error) {
                                            if (user)
                                            {
                                                [self performSegueWithIdentifier:@"loginSuccessful" sender:self];
                                            }
                                            else
                                            {
                                                [[[UIAlertView alloc] initWithTitle:@"Access denied" message:[NSString stringWithFormat:@"Couldn't login. Email or password may be incorrect. Please try again."] delegate:self cancelButtonTitle:@"Roger that!" otherButtonTitles:nil] show];
                                            }
                                        }];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Access denied" message:@"You must specify an username and password." delegate:self cancelButtonTitle:@"Roger that!" otherButtonTitles:nil];
        [alert show];
    }
    
}

-(IBAction)signUp {
    
    if (([usernameFieldSU.text length] != 0) && ([passwordFieldSU.text length] != 0) && ([phoneFieldSU.text length] != 0))
    {
        PFUser *user = [PFUser user];
        user.username = usernameFieldSU.text;
        user.password = passwordFieldSU.text;
        
        user[@"phone"] = phoneFieldSU.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {   // Hooray! Let them use the app now.
                
                //Login was successful
                [self performSegueWithIdentifier:@"loginSuccessful" sender:nil];
                
            } else {
                NSString *errorString = [error userInfo][@"error"];
                NSLog(@"Error creating account: %@", errorString);
            }
        }];
    }
}

- (IBAction)forgotPassword {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reset Password Instructions" message:@"To reset your password, please enter your email below and check your email for the password reset link." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = 1;
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        UITextField *textfield = [alertView textFieldAtIndex:0];
        [PFUser requestPasswordResetForEmailInBackground:textfield.text];
    }
}

- (void)hideKeyBoard {
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
    [usernameFieldSU resignFirstResponder];
    [passwordFieldSU resignFirstResponder];
    [phoneFieldSU resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
