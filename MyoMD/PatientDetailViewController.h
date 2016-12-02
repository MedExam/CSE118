//
//  PatientDetailViewController.h
//  MedEx
//
//  Created by Aryaman Sharda on 11/10/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Patients.h" 

@interface PatientDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UILabel *patientName;
    IBOutlet UILabel *patientNumber;
    IBOutlet UILabel *patientEmail;
    IBOutlet UILabel *patientHeight;
    IBOutlet UILabel *patientWeight;
    IBOutlet UILabel *patientGender; 
    IBOutlet UIImageView *patientPhoto;
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Patients *patient;
@end
