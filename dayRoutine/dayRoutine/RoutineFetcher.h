//
//  RoutineFetcher.h
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#ifndef dayRoutine_RoutineFetcher_h
#define dayRoutine_RoutineFetcher_h


#import <Foundation/Foundation.h>

// keys (paths) to values in a profile dictionary
#define ROUTINE_PROFILE_NAME @"name"
#define ROUTINE_PROFILE_ACCOUNT @"account"
#define ROUTINE_PROFILE_DESCRIPTION @"discrip"
#define ROUTINE_PROFILE_PIC @"pic"

// keys (paths) to values in a activity dictionary
#define ROUTINE_ACTIVITY_START @"startT"
#define ROUTINE_ACTIVITY_END @"endT"
#define ROUTINE_ACTIVITY_CONTENT @"activity"

// keys (paths) to values in a color dictionary
#define ROUTINE_COLOR_TAG @"tag"
#define ROUTINE_COLOR_VALUE @"value"

@interface RoutineFetcher : NSObject

@end;

#endif

