//
//  AddViewController.m
//  CarSpotter
//
//  Created by Jason Williams on 2016-02-18.
//  Copyright © 2016 Screaming Goat. All rights reserved.
//

#import "AddViewController.h"
#import <CoreData/CoreData.h>

@interface AddViewController ()

@end

@implementation AddViewController

@synthesize device;

-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.device) {
        [self.carMake setText:[self.device valueForKey:@"text1"]];
        [self.carModel setText:[self.device valueForKey:@"text2"]];
        [self.carYear setText:[self.device valueForKey:@"text3"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveData:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        [self.device setValue:self.carMake.text forKey:@"text1"];
        [self.device setValue:self.carModel.text forKey:@"text2"];
        [self.device setValue:self.carYear.text forKey:@"text3"];

    } else {
        
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        
        [newDevice setValue:self.carMake.text forKey:@"text1"];
        [newDevice setValue:self.carModel.text forKey:@"text2"];
        [newDevice setValue:self.carYear.text forKey:@"text3"];
    }
    
    NSError *error = nil;
    
    if (![context save:&error]) {
        NSLog(@"%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)dismissKeyboard:(id)sender {
    
    [self resignFirstResponder];
    
    }
@end
