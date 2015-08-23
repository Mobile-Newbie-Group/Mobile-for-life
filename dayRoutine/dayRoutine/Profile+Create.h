//
//  Profile+Create.h
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "Profile.h"

@interface Profile (Create)

+ (Profile *)profileWithDictionary:(NSDictionary *)profileDictionary
            inManagedObjectContext:(NSManagedObjectContext *)context;

+ (NSArray*)getMatchResultwithAccount:(NSString*)account
               inManagedObjectContext:(NSManagedObjectContext *)context;

@end
