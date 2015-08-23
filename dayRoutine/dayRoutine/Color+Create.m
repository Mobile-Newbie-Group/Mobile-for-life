//
//  Color+Create.m
//  dayRoutine
//
//  Created by James chan on 22/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "Color+Create.h"

@implementation Color (Create)

+ (Color *)colorWithTag:(NSString *)tag
              withValue:(id )value
 inManagedObjectContext:(NSManagedObjectContext *)context;
{
    Color *colorObj = nil;
    
    if ([tag length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Color"];
        request.predicate = [NSPredicate predicateWithFormat:@"tag = %@", tag];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            colorObj = [NSEntityDescription insertNewObjectForEntityForName:@"Color"
                                                         inManagedObjectContext:context];
            colorObj.tag = tag;
            colorObj.value = value;
        } else {
            colorObj= [matches lastObject];
        }
    }
    
    return colorObj;

}

@end
