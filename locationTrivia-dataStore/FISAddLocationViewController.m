//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Bettina on 7/2/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"
#import "FISLocationsTableViewController.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.nameField.accessibilityLabel =@"nameField";
    self.nameField.accessibilityIdentifier =@"nameField";
    
    self.latitudeField.accessibilityLabel =@"latitudeField";
    self.latitudeField.accessibilityIdentifier =@"latitudeField";
    
    self.longitudeField.accessibilityLabel =@"longitudeField";
    self.longitudeField.accessibilityIdentifier =@"longitudeField";
    
    self.saveButton.accessibilityLabel =@"saveButton";
    self.saveButton.accessibilityIdentifier =@"saveButton";
    
    self.cancelButton.accessibilityIdentifier =@"cancelButton";
    self.cancelButton.accessibilityIdentifier =@"cancelButton";
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
   // [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonTapped:(id)sender {
    
    FISLocation *newLocation = [[FISLocation alloc]init];
    
    newLocation.name = self.nameField.text;
    newLocation.latitude = [self.latitudeField.text floatValue];
    newLocation.longitude =[self.longitudeField.text floatValue];
    
    FISLocationsDataStore *dataStore =[FISLocationsDataStore sharedLocationsDataStore];
    
    [dataStore.locations addObject:newLocation];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //[self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
