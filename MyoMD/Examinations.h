//
//  Examinations.h
//  MedEx
//
//  Created by Aryaman Sharda on 12/1/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Examinations : NSObject
@property (nonatomic, retain) NSString *examinationID; 
@property (nonatomic, retain) NSString *patientID;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSArray *gumTestResults;
@end
