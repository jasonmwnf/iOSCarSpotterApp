//
//  AddViewController.h
//  CarSpotter
//
//  Created by Jason Williams on 2016-02-18.
//  Copyright © 2016 Screaming Goat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *carMake;
@property (weak, nonatomic) IBOutlet UITextField *carModel;
@property (weak, nonatomic) IBOutlet UITextField *carYear;

@property (strong) NSManagedObjectModel *device;


- (IBAction)saveData:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
