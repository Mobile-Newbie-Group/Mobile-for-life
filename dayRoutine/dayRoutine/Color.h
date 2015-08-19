//
//  Color.h
//  dayRoutine
//
//  Created by xuhao on 15/8/19.
//  Copyright (c) 2015年 James` Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Color : NSManagedObject

@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) id value;
@property (nonatomic, retain) NSSet *activity;
@end

@interface Color (CoreDataGeneratedAccessors)

- (void)addActivityObject:(NSManagedObject *)value;
- (void)removeActivityObject:(NSManagedObject *)value;
- (void)addActivity:(NSSet *)values;
- (void)removeActivity:(NSSet *)values;

@end
