//
//  TeethDetailViewController.m
//  MyoMD
//
//  Created by Aryaman Sharda on 10/25/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import "TeethDetailViewController.h"
#import <MyoKit/MyoKit.h>
#import <QuartzCore/QuartzCore.h> 

@interface TeethDetailViewController ()

@end

@implementation TeethDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:.08 green:.474 blue:.99215 alpha:1]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGRect frame = CGRectMake(0, 0, 375, 64);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Montserrat-Regular" size:17.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = @"GUM TEST";
    self.navigationItem.titleView = label;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-social-image.png"]];
    
    [[TLMHub sharedHub] setLockingPolicy:TLMLockingPolicyNone];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceivePoseChange:)
                                                 name:TLMMyoDidReceivePoseChangedNotification
                                               object:nil];
    
    tooth1.delegate = self;
    tooth2.delegate = self;
    tooth3.delegate = self;
    tooth4.delegate = self;
    
    tooth5.delegate = self;
    tooth6.delegate = self;
    tooth7.delegate = self;
    tooth8.delegate = self;
    
    tooth9.delegate = self;
    tooth10.delegate = self;
    tooth11.delegate = self;
    tooth12.delegate = self;
    
    tooth13.delegate = self;
    tooth14.delegate = self;
    tooth15.delegate = self;
    tooth16.delegate = self;
    
    tooth17.delegate = self;
    tooth18.delegate = self;
    tooth19.delegate = self;
    tooth20.delegate = self;
    
    tooth21.delegate = self;
    tooth22.delegate = self;
    tooth23.delegate = self;
    tooth24.delegate = self;
    
    tooth25.delegate = self;
    tooth26.delegate = self;
    tooth27.delegate = self;
    tooth28.delegate = self;
    
    tooth29.delegate = self;
    tooth30.delegate = self;
    tooth31.delegate = self;
    tooth32.delegate = self;
    
    if (_exam != NULL) {
        tooth1.text = _exam.gumTestResults[0];
        tooth2.text = _exam.gumTestResults[1];
        tooth3.text = _exam.gumTestResults[2];
        tooth4.text = _exam.gumTestResults[3];
        
        tooth5.text = _exam.gumTestResults[4];
        tooth6.text = _exam.gumTestResults[5];
        tooth7.text = _exam.gumTestResults[6];
        tooth8.text = _exam.gumTestResults[7];
        
        tooth9.text = _exam.gumTestResults[8];
        tooth10.text = _exam.gumTestResults[9];
        tooth11.text = _exam.gumTestResults[10];
        tooth12.text = _exam.gumTestResults[11];
        
        tooth13.text = _exam.gumTestResults[12];
        tooth14.text = _exam.gumTestResults[13];
        tooth15.text = _exam.gumTestResults[14];
        tooth16.text = _exam.gumTestResults[15];
        
        tooth17.text = _exam.gumTestResults[16];
        tooth18.text = _exam.gumTestResults[17];
        tooth19.text = _exam.gumTestResults[18];
        tooth20.text = _exam.gumTestResults[19];
        
        tooth21.text = _exam.gumTestResults[20];
        tooth22.text = _exam.gumTestResults[21];
        tooth23.text = _exam.gumTestResults[22];
        tooth24.text = _exam.gumTestResults[23];
        
        tooth25.text = _exam.gumTestResults[24];
        tooth26.text = _exam.gumTestResults[25];
        tooth27.text = _exam.gumTestResults[26];
        tooth28.text = _exam.gumTestResults[27];
        
        tooth29.text = _exam.gumTestResults[28];
        tooth30.text = _exam.gumTestResults[29];
        tooth31.text = _exam.gumTestResults[30];
        tooth32.text = _exam.gumTestResults[31];
    }
}

-(IBAction)syncMyo:(id)sender {
    UINavigationController *settings = [TLMSettingsViewController settingsInNavigationController];
    [self presentViewController:settings animated:YES completion:nil];
}

-(void)viewWillLayoutSubviews{
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.view.clipsToBounds = YES;
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = 0.0;
        if(UIDeviceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation]))
            screenHeight = screenRect.size.height;
        else
            screenHeight = screenRect.size.width;
        CGRect screenFrame = CGRectMake(0, 20, self.view.frame.size.width,screenHeight-20);
        CGRect viewFr = [self.view convertRect:self.view.frame toView:nil];
        if (!CGRectEqualToRect(screenFrame, viewFr))
        {
            self.view.frame = screenFrame;
            self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == tooth1) {
        [textField resignFirstResponder];
        [tooth2 becomeFirstResponder];
    }
    else if (textField == tooth2) {
        [textField resignFirstResponder];
        [tooth3 becomeFirstResponder];
    }
    else if (textField == tooth3) {
        [textField resignFirstResponder];
        [tooth4 becomeFirstResponder];
    }
    else if (textField == tooth4) {
        [textField resignFirstResponder];
        [tooth5 becomeFirstResponder];
    }
    else if (textField == tooth5) {
        [textField resignFirstResponder];
        [tooth6 becomeFirstResponder];
    }
    else if (textField == tooth6) {
        [textField resignFirstResponder];
        [tooth7 becomeFirstResponder];
    }
    else if (textField == tooth7) {
        [textField resignFirstResponder];
        [tooth8 becomeFirstResponder];
    }
    else if (textField == tooth8) {
        [textField resignFirstResponder];
        [tooth9 becomeFirstResponder];
    }
    else if (textField == tooth9) {
        [textField resignFirstResponder];
        [tooth10 becomeFirstResponder];
    }
    else if (textField == tooth10) {
        [textField resignFirstResponder];
        [tooth11 becomeFirstResponder];
    }
    else if (textField == tooth11) {
        [textField resignFirstResponder];
        [tooth12 becomeFirstResponder];
    }else if (textField == tooth12) {
        [textField resignFirstResponder];
        [tooth13 becomeFirstResponder];
    }
    else if (textField == tooth13) {
        [textField resignFirstResponder];
        [tooth14 becomeFirstResponder];
    }
    else if (textField == tooth14) {
        [textField resignFirstResponder];
        [tooth15 becomeFirstResponder];
    }
    else if (textField == tooth15) {
        [textField resignFirstResponder];
        [tooth16 becomeFirstResponder];
    }
    else if (textField == tooth16) {
        [textField resignFirstResponder];
        [tooth17 becomeFirstResponder];
    }
    else if (textField == tooth17) {
        [textField resignFirstResponder];
        [tooth18 becomeFirstResponder];
    }
    else if (textField == tooth18) {
        [textField resignFirstResponder];
        [tooth19 becomeFirstResponder];
    }
    else if (textField == tooth19) {
        [textField resignFirstResponder];
        [tooth20 becomeFirstResponder];
    }
    else if (textField == tooth20) {
        [textField resignFirstResponder];
        [tooth21 becomeFirstResponder];
    }
    else if (textField == tooth21) {
        [textField resignFirstResponder];
        [tooth22 becomeFirstResponder];
    }else if (textField == tooth22) {
        [textField resignFirstResponder];
        [tooth23 becomeFirstResponder];
    }
    else if (textField == tooth23) {
        [textField resignFirstResponder];
        [tooth24 becomeFirstResponder];
    }
    else if (textField == tooth24) {
        [textField resignFirstResponder];
        [tooth25 becomeFirstResponder];
    }
    else if (textField == tooth25) {
        [textField resignFirstResponder];
        [tooth26 becomeFirstResponder];
    }
    else if (textField == tooth26) {
        [textField resignFirstResponder];
        [tooth27 becomeFirstResponder];
    }
    else if (textField == tooth27) {
        [textField resignFirstResponder];
        [tooth28 becomeFirstResponder];
    }
    else if (textField == tooth28) {
        [textField resignFirstResponder];
        [tooth29 becomeFirstResponder];
    }
    else if (textField == tooth29) {
        [textField resignFirstResponder];
        [tooth30 becomeFirstResponder];
    }
    else if (textField == tooth30) {
        [textField resignFirstResponder];
        [tooth31 becomeFirstResponder];
    }else if (textField == tooth31) {
        [textField resignFirstResponder];
        [tooth32 becomeFirstResponder];
    }
    else if (textField == tooth32) {
        [textField resignFirstResponder];
    }
    return YES;
}

-(IBAction)dismissView:(id)sender {
    NSLog(@"Hitting here");
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

- (void)holdUnlockForMyo:(TLMMyo *)myo {
    [myo unlockWithType:TLMUnlockTypeHold];
}

- (void)endHoldUnlockForMyo:(TLMMyo *)myo immediately:(BOOL)immediately {
    if (immediately) {
        [myo lock];
    } else {
        [myo unlockWithType:TLMUnlockTypeTimed];
    }
}

- (void)didReceivePoseChange:(NSNotification*)notification {
    TLMPose *pose = notification.userInfo[kTLMKeyPose];
    
    if (pose.type == TLMPoseTypeDoubleTap) {
        NSLog(@"Double tap, registered.");
        for (UIView *view in [self.view subviews]) {
            if ([view isKindOfClass:[UITextField class]]) {
                
                UITextField *textField = (UITextField *)view;
                if ([textField isFirstResponder]) {
                    int intValue = 1;
                    
                    if (textField.text && textField.text.length > 0) {
                        intValue = [textField.text intValue] + 1;
                    }
                    textField.text = [NSString stringWithFormat:@"%d", intValue];
                }
            }
        }

        
    }
    
    if (pose.type == TLMPoseTypeWaveOut) {
        NSLog(@"Swipe right, registered.");
        for (UIView *view in [self.view subviews]) {
            if ([view isKindOfClass:[UITextField class]]) {
                
                UITextField *textField = (UITextField *)view;
                if ([textField isFirstResponder]) {
                    [self textFieldShouldReturn:textField];
                    break;
                }
            }
        }
    }
}

-(IBAction)saveGumTest:(id)sender {
    NSArray *gumTest = [[NSArray alloc] initWithObjects:
                        tooth1.text,
                        tooth2.text,
                        tooth3.text,
                        tooth4.text,
                        tooth5.text,
                        tooth6.text,
                        tooth7.text,
                        tooth8.text,
                        tooth9.text,
                        tooth10.text,
                        tooth11.text,
                        tooth12.text,
                        tooth13.text,
                        tooth14.text,
                        tooth15.text,
                        tooth16.text,
                        tooth17.text,
                        tooth18.text,
                        tooth19.text,
                        tooth20.text,
                        tooth21.text,
                        tooth22.text,
                        tooth23.text,
                        tooth24.text,
                        tooth25.text,
                        tooth26.text,
                        tooth27.text,
                        tooth28.text,
                        tooth29.text,
                        tooth30.text,
                        tooth31.text,
                        tooth32.text,
                        nil];
    
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate]; // Get necessary date components

    UIGraphicsBeginImageContext(gumView.frame.size);
    [gumView.layer renderInContext:UIGraphicsGetCurrentContext()];

    NSData *imageData = UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext());
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    [imageFile save];
    
    if (_exam != NULL) {
        PFQuery *query = [PFQuery queryWithClassName:@"Examinations"];
        [query getObjectInBackgroundWithId:_exam.examinationID
                                     block:^(PFObject *object, NSError *error) {
                                         object[@"gumTestResults"] = gumTest;
                                         object[@"examinationDate"] = [NSString stringWithFormat:@"%ld//%ld//%ld", (long)[components month], (long)[components day], (long)[components year]];
                                         [object setObject:imageFile forKey:@"imageFile"];
                                         [object saveInBackground];
                                         [self dismissView:nil];
                                     }];

    } else {
        PFObject *examination = [PFObject objectWithClassName:@"Examinations"];
        examination[@"patientID"] = _patient.patientID;
        examination[@"gumTestResults"] = gumTest;
        [examination setObject:imageFile forKey:@"imageFile"];
        examination[@"examinationDate"] = [NSString stringWithFormat:@"%ld//%ld//%ld", (long)[components month], (long)[components day], (long)[components year]];
        [examination saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                [self dismissView:nil];
                NSLog(@"Examination saved");
            } else {
                // There was a problem, check error.description
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
