//
//  PatientTableViewCell.h
//  MyoMD
//
//  Created by Aryaman Sharda on 10/25/16.
//  Copyright © 2016 Aryaman Sharda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *patientName;
@property (nonatomic, weak) IBOutlet UILabel *patientPhone;
@property (nonatomic, weak) IBOutlet UILabel *patientEmail;
@property (nonatomic, weak) IBOutlet UIImageView *patientPhoto;
@end
