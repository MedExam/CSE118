//
//  TeethDetailViewController.h
//  MyoMD
//
//  Created by Aryaman Sharda on 10/25/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Patients.h"

@interface TeethDetailViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *tooth1;
    IBOutlet UITextField *tooth2;
    IBOutlet UITextField *tooth3;
    IBOutlet UITextField *tooth4;
    
    IBOutlet UITextField *tooth5;
    IBOutlet UITextField *tooth6;
    IBOutlet UITextField *tooth7;
    IBOutlet UITextField *tooth8;
    
    IBOutlet UITextField *tooth9;
    IBOutlet UITextField *tooth10;
    IBOutlet UITextField *tooth11;
    IBOutlet UITextField *tooth12;

    IBOutlet UITextField *tooth13;
    IBOutlet UITextField *tooth14;
    IBOutlet UITextField *tooth15;
    IBOutlet UITextField *tooth16;
    
    IBOutlet UITextField *tooth17;
    IBOutlet UITextField *tooth18;
    IBOutlet UITextField *tooth19;
    IBOutlet UITextField *tooth20;
    
    IBOutlet UITextField *tooth21;
    IBOutlet UITextField *tooth22;
    IBOutlet UITextField *tooth23;
    IBOutlet UITextField *tooth24;
    
    IBOutlet UITextField *tooth25;
    IBOutlet UITextField *tooth26;
    IBOutlet UITextField *tooth27;
    IBOutlet UITextField *tooth28;
    
    IBOutlet UITextField *tooth29;
    IBOutlet UITextField *tooth30;
    IBOutlet UITextField *tooth31;
    IBOutlet UITextField *tooth32;
}

@property Patients *patient;
@property Examinations *exam;

@end
