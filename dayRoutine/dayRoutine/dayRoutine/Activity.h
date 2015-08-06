//
//  Activity.h
//  dayRoutine
//
//  Created by James chan on 3/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject

@property (strong,nonatomic) NSDate *start;
@property (strong,nonatomic) NSDate *end;
@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter = isChosen)BOOL chosen;

-(int) match : (NSArray *)otherActivities;

@end
