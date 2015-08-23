//
//  Activity+Create.m
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "Activity+Create.h"
#import "RoutineFetcher.h"
#import "Profile+Create.h"
#import "Color+Create.h"


@implementation Activity (Create)


+ (BOOL)ActivityIsValidfromTime:(double)startT
                         toTime:(double)endT
         inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSString *start = [NSString stringWithFormat:@"%.4g", startT];
    NSString *end = [NSString stringWithFormat:@"%.4g", endT];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Activity"];
    request.predicate = [NSPredicate predicateWithFormat:@"(startT = %@) and (endT = %@) ", start,end];
    NSError *error;
    NSArray *arr = [context executeFetchRequest:request error:&error];
    if (error) {
        return NO;
    }else if ([arr count] >=1 )
        return NO;
    
    return YES;
}

+ (Activity *)ActivityWithDictionary:(NSDictionary *)activityDictionary
                       withAccountID:(NSString*)account
              inManagedObjectContext:(NSManagedObjectContext *)context;
{
    Activity *activity = nil;
    
    double startT = [activityDictionary[ROUTINE_ACTIVITY_START] doubleValue];
    double endT = [activityDictionary[ROUTINE_ACTIVITY_END] doubleValue];
    
    //the input record is valid
    if ([Activity ActivityIsValidfromTime:startT
                                   toTime:endT
                   inManagedObjectContext:context]) {
        
        activity = [NSEntityDescription insertNewObjectForEntityForName:@"Activity"
                                                inManagedObjectContext:context];
        
        activity.startT = [NSNumber numberWithDouble:startT];
        activity.endT = [NSNumber numberWithDouble:endT];
        activity.activity = activityDictionary[ROUTINE_ACTIVITY_CONTENT];
        
        activity.belongTo = (Profile*)[[Profile getMatchResultwithAccount:account
                                        inManagedObjectContext:context] firstObject];
        
        activity.hasColor = [Color colorWithTag:activityDictionary[ROUTINE_COLOR_TAG]
                                      withValue:activityDictionary[ROUTINE_COLOR_VALUE]
                         inManagedObjectContext:context];
    }
    
    return activity;

}

@end
