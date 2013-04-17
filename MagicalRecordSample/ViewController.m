//
//  ViewController.m
//  MagicalRecordSample
//
//  Created by Paulo Khouri on 4/17/13.
//  Copyright (c) 2013 Mobilitate. All rights reserved.
//

#import "ViewController.h"
#import "Notes.h"
#import "MTEditNoteViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *notes;
@property (strong, nonatomic) Notes *note;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Fetch Notes
    [self fetchNotes];
    // Reload Table View
    [self.tableView reloadData];
}

- (void)fetchNotes {
    // Fetch Notes
    self.notes = [NSMutableArray arrayWithArray:[Notes findAll]];
}

- (void)fetchSortedNotes {
    // Fetch Sorted Notes
    self.notes = [NSMutableArray arrayWithArray:[Notes findAllSortedBy:@"date" ascending:YES]];
}

- (void)fetchNotesByAttribute:(NSString *)attribute withValue:(id)value {
    self.notes = [NSMutableArray arrayWithArray:[Notes findByAttribute:attribute withValue:value]];
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        // Configure Cell
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    // Fetch Note
    Notes *note = [self.notes objectAtIndex:[indexPath row]];
    // Configure Cell
    [cell.textLabel setText:[note title]];
    [cell.detailTextLabel setText:[note keywords]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Fetch Note
        Notes *note = [self.notes objectAtIndex:[indexPath row]];
        // Delete Note from Data Source
        [self.notes removeObjectAtIndex:[indexPath row]];
        // Delete Entity
        [note deleteEntity];
        // Update Table View
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Fetch Note
    self.note = [self.notes objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EditNote" sender:self];
}

- (IBAction)editAction:(id)sender {
    [self.tableView setEditing:![self.tableView isEditing] animated:YES];
    if (self.tableView.isEditing) {
        [self.editButton setTitle:@"Done"];
    } else {
        [self.editButton setTitle:@"Edit"];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditNote"]) {
        //MTEditNoteViewController *editNote = (MTEditNoteViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        MTEditNoteViewController *editNote = (MTEditNoteViewController *)segue.destinationViewController;
        editNote.note = self.note;
    }
}

@end
