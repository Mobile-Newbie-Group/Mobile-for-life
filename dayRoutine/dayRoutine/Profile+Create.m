//
//  Profile+Create.m
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "Profile+Create.h"
#import "RoutineFetcher.h"

@implementation Profile (Create)

+(NSArray*)getMatchResultwithAccount:(NSString *)account
              inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Profile"];
    request.predicate = [NSPredicate predicateWithFormat:@"account = %@", account];
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    if (error) {
        return Nil;
    }else return arr;
}

+ (Profile *)profileWithDictionary:(NSDictionary *)profileDictionary
            inManagedObjectContext:(NSManagedObjectContext *)context;
{
    Profile *profile = nil;
    
    NSString* account = profileDictionary[ROUTINE_PROFILE_ACCOUNT];
    
    NSArray *matches = [Profile getMatchResultwithAccount:account inManagedObjectContext:context];
    
    if (!matches || ([matches count] > 1)) {
        // if there is an error / more than 1 record, handle it
        
    } else if ([matches count]) {
        
        profile = [matches firstObject];
        
    } else { //create a new reocrd
        profile = [NSEntityDescription insertNewObjectForEntityForName:@"Profile"
                                              inManagedObjectContext:context];
        
        profile.name = profileDictionary[ROUTINE_PROFILE_NAME];
        profile.account = profileDictionary[ROUTINE_PROFILE_ACCOUNT];
        profile.descrip = profileDictionary[ROUTINE_PROFILE_DESCRIPTION];
        profile.pic = profileDictionary[ROUTINE_PROFILE_PIC];
    }
    
    return profile;
}

@end
