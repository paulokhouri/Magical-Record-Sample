//
//  MTEditNoteViewController.h
//  MagicalRecordSample
//
//  Created by Paulo Khouri on 4/17/13.
//  Copyright (c) 2013 Mobilitate. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Notes;

@interface MTEditNoteViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *keywordsField;
@property (strong, nonatomic) IBOutlet UITextView *bodyView;

@property (strong, nonatomic) Notes *note;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end
