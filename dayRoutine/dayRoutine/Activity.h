//
//  Activity.h
//  dayRoutine
//
//  Created by xuhao on 15/8/19.
//  Copyright (c) 2015年 James` Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Color, Profile;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * activity;
@property (nonatomic, retain) NSNumber * endT;
@property (nonatomic, retain) NSNumber * startT;
@property (nonatomic, retain) Color *color;
@property (nonatomic, retain) Profile *profile;

@end
