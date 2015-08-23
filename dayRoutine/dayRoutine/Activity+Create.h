//
//  Activity+Create.h
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "Activity.h"

@interface Activity (Create)

+ (Activity *)ActivityWithDictionary:(NSDictionary *)activityDictionary
                       withAccountID:(NSString*)account
              inManagedObjectContext:(NSManagedObjectContext *)context;

+ (BOOL)ActivityIsValidfromTime:(double)startT
                         toTime:(double)endT
         inManagedObjectContext:(NSManagedObjectContext *)context;

@end
