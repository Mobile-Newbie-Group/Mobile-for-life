//
//  Activity.h
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Color, Profile;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * activity;
@property (nonatomic, retain) NSNumber * endT;
@property (nonatomic, retain) NSNumber * startT;
@property (nonatomic, retain) Color *hasColor;
@property (nonatomic, retain) Profile *belongTo;

@end
