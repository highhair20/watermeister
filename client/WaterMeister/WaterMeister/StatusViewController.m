//
//  StatusViewController.m
//  WaterMeister
//
//  Created by Jason Kelly on 5/9/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import "StatusViewController.h"
#import "ProgramDetailViewController.h"

@interface StatusViewController () {
    @private NSMutableArray *programs;
    @private NSMutableArray *stations;
    
    @private NSString *programDetailAction;
    @private NSString *zoneDetailAction;
}

@end

@implementation StatusViewController

static NSString *const ProgramTargetView = @"programDetailView";
static NSString *const ZoneTargetView = @"zoneDetailView";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set the title of the view
    self.title = @"WaterMeister System Status";
    
    // create the array of programs
    programs = [[NSMutableArray alloc] init];
    SprinklerProgram *program = [[SprinklerProgram alloc] init];
    program.name = @"Program 1";
    program.status = @"Off";
    
    // create the array of stations
    stations = [[NSMutableArray alloc] init];
    
    // add the stations to the stations object
    // in the future this will be more dynamic
    SprinklerStation *station = [[SprinklerStation alloc] init];
    station.name = @"Planter box 1";
    station.status = @"Off";
    [stations addObject:station];
    [program addStation:station];
    [programs addObject:program];
    
    station = [[SprinklerStation alloc] init];
    station.name = @"Planter box 2";
    station.status = @"Off";
    [stations addObject:station];
    
    station = [[SprinklerStation alloc] init];
    station.name = @"Planter box Long";
    station.status = @"Off";
    [stations addObject:station];
    
    station = [[SprinklerStation alloc] init];
    station.name = @"Planter box 4";
    station.status = @"Off";
    [stations addObject:station];
    
    station = [[SprinklerStation alloc] init];
    station.name = @"Planter box 5";
    station.status = @"Loading...";
    [stations addObject:station];
    
    station = [[SprinklerStation alloc] init];
    station.name = @"Planter Walkway";
    station.status = @"Running";
    [stations addObject:station];
    
    station = [[SprinklerStation alloc] init];
    station.name = @"Garden Gate";
    station.status = @"Off";
    [stations addObject:station];
    
    station = [[SprinklerStation alloc] init];
    station.name = @"Patio Trees";
    station.status = @"Off";
    [stations addObject:station];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // initialize any state parameters
    self->programDetailAction = @"edit";
    self->zoneDetailAction = @"edit";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"numberOfRowsInSection %ld", (long)section);
    NSInteger count;
    if (section == 0) {
        count = programs.count;
    } else if (section == 1) {
        count = stations.count;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    // Configure the cell...
    if (indexPath.section == 0) {
        NSString *cellIdentifier = @"ProgramCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        SprinklerProgram *current = [programs objectAtIndex:indexPath.row];
        cell.textLabel.text = [current name];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.detailTextLabel.text = [current status];
        cell.detailTextLabel.textColor = [current statusTextColor];
    } else if (indexPath.section == 1) {
        NSString *cellIdentifier = @"ZoneCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        SprinklerStation *current = [stations objectAtIndex:indexPath.row];
        cell.textLabel.text = [current name];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.detailTextLabel.text = [current status];
        cell.detailTextLabel.textColor = [current statusTextColor];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Programs";
    }
    if (section == 1)
    {
        return @"Zones";
    }
    return @"";
}

#pragma mark - UITableViewDelegate Methods

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect frame = tableView.frame;
    
    CGRect addButtonRect;
    NSString *addButtonTitleLabelText;
    UILabel *title;

    if (section == 0)
    {
        addButtonRect = CGRectMake(frame.size.width-45, 25, 50, 30);
        addButtonTitleLabelText = @"addProgram";
        title = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 100, 30)];
        title.text = @"Programs";
    }
    if (section == 1)
    {
        addButtonRect = CGRectMake(frame.size.width-45, 10, 50, 30);
        addButtonTitleLabelText = @"addStation";
        title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
        title.text = @"Zones";
    }

    UIButton *addButton = [[UIButton alloc] initWithFrame:addButtonRect];
    [addButton addTarget:self action:@selector(addButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    addButton.titleLabel.text = addButtonTitleLabelText;
    [addButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateSelected];
    addButton.tag = section;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [headerView addSubview:title];
    [headerView addSubview:addButton];
    
    return headerView;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue identifier is %@", [segue identifier]);
    

//    // Pass the selected object to the new view controller.
    
    // get the indexPath from the selected row
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    NSLog(@"prepareForSegue selectedIndexPath %ld", (long)selectedIndexPath.section);
    
    // determine the selected section
//    NSUInteger selectedSection = selectedIndexPath.section;
//    NSLog(@"prepareForSegue selectedSection %ld", (long)selectedSection);
    
    NSUInteger selectedRow = selectedIndexPath.row;
    NSLog(@"prepareForSegue selectedRow %ld", (long)selectedRow);
    
    if ([[segue identifier] isEqualToString:ProgramTargetView]) {
        // set the program object
        NSLog(@"set the program object");
        // Get the new view controller using [segue destinationViewController].
        ProgramDetailViewController *detailVC = [segue destinationViewController];
        NSLog(@"mode is %@", self->zoneDetailAction);
        if ([self->programDetailAction isEqualToString:@"edit"]) {
            SprinklerProgram *program = self->programs[selectedRow];
            [detailVC setCurrentProgram: program];
        }
        
    } else if ([[segue identifier] isEqualToString:ZoneTargetView]) {
        // set the sprinkler object
        NSLog(@"set the zone object");
        
    }
    
    

    
    
//    Photo *c = photos[selectedRow];
//    [pvc setCurrentPhoto:c];
//    // or pvc.currentPhoto = c; // doesn't matter
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//    NSLog(@"prepareForSegue indexPath %ld", (long)indexPath.section);
    
//    NSIndexPath *indexPath = [self.tableView indexPathForRow:];
    
    
    
//    InfoViewController *ivc = [segue destinationViewController];
//    ivc.currentPhoto = self.currentPhoto;
    
}


#pragma mark - Custom Methods

- (void)addButtonPressed:(UIButton *)sender
{
    NSLog(@"addButtonPressed");
    UIButton *button = (UIButton*) sender;
    NSLog(@"sender tag %ld", (long)button.tag);
    NSString *targetDetailView;
    if (button.tag == 0) {
        targetDetailView = ProgramTargetView;
        self->programDetailAction = @"add";
        NSLog(@"doing performSegueWithIdentifier to %@ in mode %@", targetDetailView, self->programDetailAction);
    } else if (button.tag == 1) {
        targetDetailView = ZoneTargetView;
        self->zoneDetailAction = @"add";
        NSLog(@"doing performSegueWithIdentifier to %@ in mode %@", targetDetailView, self->zoneDetailAction);
    }
    [self performSegueWithIdentifier:targetDetailView sender:self];
    return;
}

@end
