//
//  Patients.h
//  MedEx
//
//  Created by Aryaman Sharda on 11/28/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Examinations.h"

@interface Patients : NSObject
@property (nonatomic, retain) NSString *patientID;
@property (nonatomic, retain) NSString *patientName;
@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *emailId;
@property (nonatomic, retain) NSNumber *height;
@property (nonatomic, retain) NSNumber *weight;
@property (nonatomic, retain) NSArray *allergies;
@property (nonatomic, retain) NSArray *examinations;
@property (nonatomic, retain) NSArray *medications;
@property (nonatomic, retain) NSString *patientPhotoName;
@end
