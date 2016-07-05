//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Bettina on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocationsDataStore.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()
@property (strong, nonatomic) NSMutableArray *locations; //private here because so that noone else can add locations to this tableViewController. job of viewController is to take data nd push it to the views. evertything marked in public (.h) is like a public contract, like saying this won't change. even i porject mode...only mka ethings public tha tyo uabsolutltely ned to, by going public load on yourself to update it and notify others of changes.

@property (strong, nonatomic) FISLocationsDataStore *store; //private because you don't want anyone else to access your viewController through your dataStore, they can create their own.

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self. navigationItem.rightBarButtonItem.accessibilityIdentifier =@"addButton";
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return [self.store.locations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    
    FISLocation *currentLocation = self.store.locations[indexPath.row];
   // FISLocation currenLocation =self.locations[indexPath.row];
    
    
    cell.textLabel.text = currentLocation.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",currentLocation.trivia.count];
    
    // Configure the cell...
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    FISTriviaTableViewController *destinationVC = (FISTriviaTableViewController *)segue.destinationViewController;
    
    if([segue.identifier isEqualToString:@"locationsToTriviaSegue"]){
    
        
    UITableViewCell *mainCell = (UITableViewCell *)sender;
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForCell:mainCell];
    
    FISLocation *selectedLocation = self.store.locations[selectedIndexPath.row];
    
    destinationVC.location = selectedLocation;
    }
//    NSString *nameOfLocation = mainCell.textLabel.text;
//    
//    FISLocation *locationSelected = [[FISLocation alloc]init];
//    
//    for (FISLocation *locationSearched in self.store.locations){
//        if([locationSearched.name isEqual:nameOfLocation]){
//            locationSelected = locationSearched;
//        }
//    }
          //destinationVC.location = locationSelected
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
