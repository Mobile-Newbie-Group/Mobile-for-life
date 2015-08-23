//
//  Color.h
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface Color : NSManagedObject

@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) id value;
@property (nonatomic, retain) NSSet *belongTo;
@end

@interface Color (CoreDataGeneratedAccessors)

- (void)addBelongToObject:(Activity *)value;
- (void)removeBelongToObject:(Activity *)value;
- (void)addBelongTo:(NSSet *)values;
- (void)removeBelongTo:(NSSet *)values;

@end
