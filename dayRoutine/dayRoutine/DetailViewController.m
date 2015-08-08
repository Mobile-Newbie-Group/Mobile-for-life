//
//  DetailViewController.m
//  dayRoutine
//
//  Created by James chan on 8/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//


#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic) NSMutableArray *testPack;

@end

@implementation DetailViewController

- (NSMutableArray *)activities
{
    if(!_activities) _activities = [[NSMutableArray alloc] init];
    return _activities;
}

- (NSString *)subTitle
{
    if(!_subTitle) _subTitle = [[NSString alloc] init];
    return _subTitle;
}

- (NSString *)name
{
    if(!_name) _name = [[NSString alloc] init];
    return _name;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self.view removeFromSuperview];
    self.view.frame = CGRectMake(HORIZON_SPACE, TOP_NAVIGATION_BAR_HEIGHT , self.view.frame.size.width - 2 * HORIZON_SPACE, self.view.frame.size.height - TOP_NAVIGATION_BAR_HEIGHT - BOTTOM_TAB_BAR_HEIGHT);
    
    RoutineView *rv = [[RoutineView alloc] initWithFrame:self.view.frame];
    
    rv.title = self.name;
    rv.subTitle = self.subTitle;
    rv.activities = self.activities;
    rv.pic = [UIImage imageNamed:rv.title];
    
    [self.view addSubview:rv];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
