//
//  DetailViewController.h
//  dayRoutine
//
//  Created by James chan on 8/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutineView.h"


@interface DetailViewController :  UIViewController

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *subTitle;
@property (nonatomic,strong) NSMutableArray *activities;

#define BOTTOM_TAB_BAR_HEIGHT 49
#define TOP_NAVIGATION_BAR_HEIGHT 64
#define HORIZON_SPACE 0
#define ASPECT_RATIO 180.0/180.0


@end
