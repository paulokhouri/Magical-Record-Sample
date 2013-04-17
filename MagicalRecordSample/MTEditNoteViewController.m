//
//  MTEditNoteViewController.m
//  MagicalRecordSample
//
//  Created by Paulo Khouri on 4/17/13.
//  Copyright (c) 2013 Mobilitate. All rights reserved.
//

#import "MTEditNoteViewController.h"
#import "Notes.h"

@interface MTEditNoteViewController ()
@property (nonatomic) BOOL isEditing;

@end

@implementation MTEditNoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.isEditing = NO;
    if (self.note) {
        // Populate Form Fields
        [self.titleField setText:[self.note title]];
        [self.keywordsField setText:[self.note keywords]];
        [self.bodyView setText:[self.note body]];
        self.isEditing = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    if (!self.note) {
        // Create Note
        self.note = [Notes createEntity];
        // Configure Note
        [self.note setDate:[NSDate date]];
    }
    // Configure Note
    [self.note setTitle:[self.titleField text]];
    [self.note setKeywords:[self.keywordsField text]];
    [self.note setBody:[self.bodyView text]];
    // Save Managed Object Context
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
    //[[NSManagedObjectContext defaultContext] saveNestedContexts];
    if (self.isEditing) {
        // Pop View Controller from Navigation Stack
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        // Dismiss View Controller
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
