//
//  Profile.h
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface Profile : NSManagedObject

@property (nonatomic, retain) NSString * account;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * descrip;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * occupation;
@property (nonatomic, retain) NSData * pic;
@property (nonatomic, retain) NSString * psw;
@property (nonatomic, retain) NSNumber * sex;
@property (nonatomic, retain) NSSet *hasActivity;
@end

@interface Profile (CoreDataGeneratedAccessors)

- (void)addHasActivityObject:(Activity *)value;
- (void)removeHasActivityObject:(Activity *)value;
- (void)addHasActivity:(NSSet *)values;
- (void)removeHasActivity:(NSSet *)values;

@end
