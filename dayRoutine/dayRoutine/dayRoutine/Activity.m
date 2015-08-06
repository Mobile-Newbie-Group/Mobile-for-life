//
//  Activity.m
//  dayRoutine
//
//  Created by James chan on 3/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "Activity.h"

@implementation Activity

-(int) match:(NSArray *)otherActivities
{
    int score = 0;
    
    for(Activity *act in otherActivities){
        if ([act.contents isEqualToString:self.contents]) {
            score++;
        }
    }
    return score;
}

-(NSString*)getStr:(NSDate*)dateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *result = [[NSString alloc] initWithString: [formatter stringFromDate: [NSDate date]]];
    return result;
}


@end
