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

#define CIRCUIT_INCREMENT 1
#define CIRCUIT_EXTERNAL_RADIUS 110
#define CIRCUIT_MIDDLE_RADIUS 100
#define CIRCUIT_INTERNAL_RADIUS 70

@end

