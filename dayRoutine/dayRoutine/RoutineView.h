//
//  RoutineView.h
//  dayRoutine
//
//  Created by James chan on 5/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface RoutineView: UIView

@property (nonatomic) UIImage *pic;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *subTitle;
@property (nonatomic) NSMutableArray *activities;


- (UIColor*) getDefinedColor :(int) number;

#define DEFAULT_PIC_SCALE_FACTOR 1;
#define DEFAULT_FRAME_LENGTH 380;
#define CIRCUIT_INCREMENT 1
#define DISPLAY_ACTIVITY_LENGTH 108

@end

