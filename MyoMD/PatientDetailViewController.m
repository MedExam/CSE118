//
//  PatientDetailViewController.m
//  MedEx
//
//  Created by Aryaman Sharda on 11/10/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import "PatientDetailViewController.h"

@interface PatientDetailViewController ()

@end

@implementation PatientDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    patientName.text = _patient.patientName;
    patientEmail.text = _patient.emailId;
    patientNumber.text = _patient.phoneNumber;
    patientGender.text = _patient.gender;
    patientHeight.text = [NSString stringWithFormat:@"%@", _patient.height];
    patientWeight.text = [NSString stringWithFormat:@"%@", _patient.weight];
    
    patientPhoto.image = [UIImage imageNamed:@"patient-place-holder"];
    patientPhoto.layer.cornerRadius = patientPhoto.frame.size.width / 2;
    patientPhoto.clipsToBounds = YES;
    
    [self setNeedsStatusBarAppearanceUpdate];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:.08 green:.474 blue:.99215 alpha:1]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-social-image.png"]];
    
    CGRect frame = CGRectMake(0, 0, 375, 64);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Montserrat-Regular" size:17.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = @"PATIENT INFO";
    self.navigationItem.titleView = label;
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

-(IBAction)dismissView:(id)sender {
    NSLog(@"Hitting here");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return [_patient.allergies count];
            break;
        case 1:
            return [_patient.medications count];
            break;
        case 2:
            return [_patient.examinations count];
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    /*
    Patients *patient = [patientData objectAtIndex:indexPath.row];
    cell.patientName.text = patient.patientName;
    cell.patientEmail.text = patient.emailId;
    cell.patientPhone.text = patient.phoneNumber;
    cell.patientPhoto.image = [UIImage imageNamed:@"patient-place-holder"];
    cell.patientPhoto.layer.cornerRadius = cell.patientPhoto.frame.size.width / 2;
    cell.patientPhoto.clipsToBounds = YES; */
    
    cell.textLabel.text = @"hi";
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Allergies";
            break;
        case 1:
            return @"Medications";
            break;
        case 2:
            return @"Examinations";
            break;
        default:
            return @"Error";
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
@end
