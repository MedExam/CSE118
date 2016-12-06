//
//  PatientDetailViewController.m
//  MedEx
//
//  Created by Aryaman Sharda on 11/10/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import "PatientDetailViewController.h"
#import "TeethDetailViewController.h"
#import "Examinations.h"

@interface PatientDetailViewController ()

@end

@implementation PatientDetailViewController
{
    Examinations *selected;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    patientName.text = _patient.patientName;
    patientEmail.text = _patient.emailId;
    patientNumber.text = _patient.phoneNumber;
    patientGender.text = _patient.gender;
    patientHeight.text = [NSString stringWithFormat:@"%@", _patient.height];
    patientWeight.text = [NSString stringWithFormat:@"%@", _patient.weight];
    
    patientPhoto.image = [UIImage imageNamed:_patient.patientPhotoName];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 2:
        {
            selected = [_patient.examinations objectAtIndex: indexPath.row];
            [self performSegueWithIdentifier:@"gumTest" sender: self];
            break;
        }
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [_patient.allergies objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [_patient.medications objectAtIndex:indexPath.row];
            break;
        case 2:
        {
            Examinations *exam = [_patient.examinations objectAtIndex:indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = exam.date;
            break;
        }
        default:
            break;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"   %@", cell.textLabel.text];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Montserrat" size:14];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 2:
            return 40;
            break;
            
        default:
            break;
    }
    
    return 22;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"ALLERGIES";
            break;
        case 1:
            return @"MEDICATIONS";
            break;
        case 2:
            return @"EXAMINATIONS";
            break;
        default:
            return @"Error";
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *sectionTitle = [[UILabel alloc] init];
    sectionTitle.frame = CGRectMake(20, 8, 375, 20);
    sectionTitle.font = [UIFont fontWithName:@"Montserrat" size:14];
    sectionTitle.textColor = [UIColor colorWithRed:.227 green:.639 blue:.996 alpha:1];
    sectionTitle.backgroundColor = [UIColor clearColor];
    sectionTitle.textAlignment = NSTextAlignmentLeft;
    sectionTitle.text = [self tableView:tableView titleForHeaderInSection:section];
    
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:sectionTitle];
    
    return headerView;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"gumTest"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        TeethDetailViewController *controller = (TeethDetailViewController *)segue.destinationViewController;
        controller.patient = _patient;
        controller.exam = selected;
        
    }
}
@end
