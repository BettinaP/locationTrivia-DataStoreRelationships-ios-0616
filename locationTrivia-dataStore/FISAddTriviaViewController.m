//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Bettina on 7/2/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"
#import "FISAddLocationViewController.h"

#import "FISTriviaTableViewController.h"
#import "FISLocationsTableViewController.h"
#import "FISLocationsDataStore.h"

@interface FISAddTriviaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addTriviaTextField;
@property (weak, nonatomic) IBOutlet UIButton *triviaCancelButton;
@property (weak, nonatomic) IBOutlet UIButton *triviaSaveButton;
@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.addTriviaTextField.accessibilityIdentifier =@"Trivium TextField";
    
    self.addTriviaTextField.accessibilityLabel =@"Trivium TextField";
    
    self.triviaCancelButton.accessibilityLabel =@"Cancel Button";
    self.triviaCancelButton.accessibilityIdentifier =@"Cancel Button";
    
    self.triviaSaveButton.accessibilityIdentifier =@"Save Button";
    self.triviaSaveButton.accessibilityLabel =@"Save Button";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)triviaCancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //[self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)triviaSaveButtonTapped:(id)sender {
    
    FISTrivium *newTrivium =[[FISTrivium alloc]initWithContent:self.addTriviaTextField.text likes:0];
 
    
    [self.addNewTriviumLocation.trivia addObject:newTrivium];
//    NSLog(@"###########################%@",newTrivium.content);
//    NSLog(@"############################%@",sender);
//    
     //Add the this new trivium to the relevant FISLocation object that was passed to the FISTriviaTableViewController
    
    
//    
//    FISLocationsDataStore *additionalStore =[FISLocationsDataStore sharedLocationsDataStore];
//    
//    for (FISLocation *additionalLocation in additionalStore.locations){
//        
//        [additionalLocation.trivia addObject:newTrivium];
//    }
    
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
