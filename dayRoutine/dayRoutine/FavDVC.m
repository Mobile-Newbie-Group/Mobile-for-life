//
//  FavDVC.m
//  dayRoutine
//
//  Created by James chan on 9/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//



#import "FavDVC.h"
#import "Profile.h"
#import "AppDelegate.h"
#import "RoutineFetcher.h"
#import "Activity.h"
#import "Color.h"


@interface FavDvc ()

@end

@implementation FavDvc

- (void)viewDidLoad {
    //[super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self.view removeFromSuperview];
    self.view.frame = CGRectMake(HORIZON_SPACE, 0 , self.view.frame.size.width - 2 * HORIZON_SPACE, self.view.frame.size.height - TOP_NAVIGATION_BAR_HEIGHT - BOTTOM_TAB_BAR_HEIGHT);
    
    RoutineView *rv = [[RoutineView alloc] initWithFrame:self.view.frame];
    
    /*rv.subTitle = @"One day in Shenzhen";
    rv.activities = [NSMutableArray arrayWithObjects:
                     @"0", @"5", @"?sleep", @"5",
                     @"5", @"9", @"", @"0",
                     @"9", @"10", @"from HK to Sheko ",@"1",
                     @"10", @"10.25", @"", @"0",
                     @"10.25", @"10.5", @"from Sheko to SZ office",@"1",
                     @"10.5", @"11", @"", @"0",
                     @"11", @"11.75", @"meet with Cindy",@"2",
                     @"11.75", @"13.5", @"lunch with team",@"1",
                     @"13.5", @"14", @"", @"0",
                     @"14", @"18", @"have fun with team", @"2",
                     @"18", @"19", @"", @"0",
                     @"19", @"20",@"dinner with team", @"1",
                     @"20", @"21", @"", @"0",
                     @"21", @"22", @"handle notes", @"5",
                     @"22", @"23", @"drink", @"5",
                     @"23", @"24", @"sleep", @"5",nil];
    rv.pic = [UIImage imageNamed:@"Gary"];*/
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *name = @"Darwin";
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Profile"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
    NSError *error;
    NSArray *arr = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (!error) {
        Profile *profile = [arr firstObject];
        rv.title = profile.name;
        rv.subTitle = profile.descrip;
        rv.pic = [[UIImage alloc] initWithData:profile.pic];
        
        NSMutableArray *tmp = [[NSMutableArray alloc] init];
        
        NSLog(@"%lu",(unsigned long)[profile.hasActivity count]);
        for (Activity *s in profile.hasActivity){
            NSLog(@"%@,%@,%@",s.startT,s.endT,s.activity);
            [tmp addObject:s.startT];
            [tmp addObject:s.endT];
            [tmp addObject:s.activity];
            [tmp addObject:s.hasColor.value];
        }
        rv.activities = tmp;
    }
    
    [self.view addSubview:rv];
    
    
}


@end