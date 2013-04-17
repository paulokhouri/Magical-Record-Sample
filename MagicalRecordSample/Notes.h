//
//  Notes.h
//  MagicalRecordSample
//
//  Created by Paulo Khouri on 4/17/13.
//  Copyright (c) 2013 Mobilitate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Notes : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSString * keywords;

@end
