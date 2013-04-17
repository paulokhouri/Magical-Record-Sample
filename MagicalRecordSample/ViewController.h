//
//  ViewController.h
//  MagicalRecordSample
//
//  Created by Paulo Khouri on 4/17/13.
//  Copyright (c) 2013 Mobilitate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

- (IBAction)editAction:(id)sender;

@end
