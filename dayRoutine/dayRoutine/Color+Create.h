//
//  Color+Create.h
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "Color.h"

@interface Color (Create)

+ (Color *)colorWithTag:(NSString *)tag
              withValue:(id )value
                inManagedObjectContext:(NSManagedObjectContext *)context;


@end
