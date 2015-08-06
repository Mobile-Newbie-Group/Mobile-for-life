//
//  RoutineView.m
//  dayRoutine
//
//  Created by James chan on 5/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//


#import "RoutineView.h"

@interface RoutineView()

@property (nonatomic) CGPoint centreP;

@end

@implementation RoutineView

- (void)setActivities:(NSMutableArray *)activities
{
    _activities = activities;
    [self setNeedsDisplay];
}


- (void)setPic:(UIImage *)pic
{
    _pic = pic;
    [self setNeedsDisplay];
}

- (void)setDescrip:(NSString *)subTitle
{
    _subTitle = subTitle;
    [self setNeedsDisplay];

}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [self setNeedsDisplay];
}

// get the frame centre
- (CGPoint )centreP
{
    return CGPointMake(self.frame.size.width/2, self.frame.size.height * 2 /3 );
}

#pragma mark - draw life routine circle

#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor] ; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundedRect addClip];

    [[UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1.0] setFill];
    UIRectFill(self.bounds); 
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];

     
    [self.pic drawInRect:CGRectMake(self.centreP.x - CIRCUIT_INTERNAL_RADIUS,self.centreP.y-CIRCUIT_INTERNAL_RADIUS,
                                                       CIRCUIT_INTERNAL_RADIUS*2,CIRCUIT_INTERNAL_RADIUS*2)];
    
    
     for (int i = 0;i < [self.activities count];i = i+4){
     
         [self drawActivy:[self.activities[i] floatValue]
                  toAngle:[self.activities[i+1] floatValue]
                withColor:[self getDefinedColor:[self.activities[i+3] intValue]]];
         
         [self addActivityLabelFromAngle: [self TimeToRadian:[self.activities[i] floatValue]]
                                 toAngle: [self TimeToRadian:[self.activities[i+1] floatValue]]
                             withRadious:CIRCUIT_EXTERNAL_RADIUS
                              usedbyText:[NSString stringWithFormat:@"%@",self.activities[i+2] ]];
     }
     
     [self drawExternalCircuit];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.title;
    
    
    [titleLabel drawTextInRect:CGRectMake(self.centreP.x - [titleLabel.text length]* 20 /2,
                                         self.centreP.y - CIRCUIT_INTERNAL_RADIUS - CIRCUIT_MIDDLE_RADIUS ,
                                          [titleLabel.text length]*20,5)];
    
    titleLabel.text = self.subTitle;
    [titleLabel drawTextInRect:CGRectMake(self.centreP.x -[titleLabel.text length]* 5,
                                         self.centreP.y - CIRCUIT_INTERNAL_RADIUS - CIRCUIT_MIDDLE_RADIUS + 15 ,
                                          [titleLabel.text length]*20 ,5)];
    
    
    

}

- (void)addActivityLabelFromAngle:(CGFloat)startAngle
                          toAngle:(CGFloat)endAngle
                      withRadious:(CGFloat)iRadius
                       usedbyText:(NSString*)text
{
    endAngle = (startAngle + endAngle)/2;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    //get the middle point of the arc
    [bezierPath addArcWithCenter:self.centreP radius:iRadius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = text;
    
    [timeLabel setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    
    double labelY = 0;
    double labelX = 0;
    
    if (endAngle < 0 || endAngle > M_PI)
        labelY = 0-10;
    else
        labelY = 10;
    
    if (endAngle >  0.5 * M_PI && endAngle < 1.5 * M_PI)
        labelX =  12 * [text length] ;
    else
        labelX = 0;
    
    [timeLabel drawTextInRect:CGRectMake(bezierPath.currentPoint.x - labelX ,
                                         bezierPath.currentPoint.y + labelY, [text length] * 20,5)];
    
}

//get defined color
- (UIColor*) getDefinedColor :(int) number
{
    if (number == 0){
        return [UIColor whiteColor];
    }if (number == 1){
        return [UIColor colorWithRed:248/255.0 green:184/255.0 blue:98/255.0 alpha:1.0];
    }if (number == 2){
        return [UIColor colorWithRed:114/255.0 green:174/255.0 blue:114/255.0 alpha:1.0] ;
    }if (number == 3){
        return [UIColor colorWithRed:57/255.0 green:187/255.0 blue:198/255.0 alpha:1.0] ;
    }if (number == 4){
        return [UIColor colorWithRed:188/255.0 green:224/255.0 blue:196/255.0 alpha:1.0] ;
    }else
        return nil;
}

//cover time to radian
- (CGFloat)TimeToRadian:(CGFloat)TimeFloat{return ((TimeFloat/6 -1) * 0.5 * M_PI);}


//draw activity
- (void)drawActivy:(CGFloat)startAngle toAngle:(CGFloat)endAngle withColor:(UIColor*) fillColor
{
    
    [self  drawCircuitFromAngle: [self TimeToRadian:startAngle]
                        toAngle: [self TimeToRadian:endAngle]
                  withFillColor: fillColor
                withStrokeColor: [UIColor whiteColor]
            FromExternalRadious: CIRCUIT_INTERNAL_RADIUS
               toInternalRadius: CIRCUIT_EXTERNAL_RADIUS];
}

//draw the time circuit
- (void)drawExternalCircuit{
    
    for ( CGFloat s = 0; s <= 24 - CIRCUIT_INCREMENT; s = s + CIRCUIT_INCREMENT ){
        
        [self  drawCircuitFromAngle: [self TimeToRadian:s]
                            toAngle: [self TimeToRadian:s + CIRCUIT_INCREMENT]
                      withFillColor: Nil
                    withStrokeColor: [UIColor blackColor]
                FromExternalRadious: CIRCUIT_MIDDLE_RADIUS
                   toInternalRadius: CIRCUIT_EXTERNAL_RADIUS];
    }
    
    //draw 2 time label
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = @"00:00";
    [timeLabel drawTextInRect:CGRectMake(self.centreP.x - 22.5,
                                         self.centreP.y - CIRCUIT_MIDDLE_RADIUS * 0.9, 45,10)];
    
    timeLabel.text = @"12:00AM";
    [timeLabel drawTextInRect:CGRectMake(self.centreP.x - 31.5,
                                         self.centreP.y + CIRCUIT_MIDDLE_RADIUS * 0.8, 70,10)];
    
}

- (void)drawCircuitFromAngle:(CGFloat)startAngle toAngle:(CGFloat)endAngle
               withFillColor:(UIColor*) fillColor withStrokeColor: (UIColor*) strokeColor
         FromExternalRadious:(CGFloat)iRadius  toInternalRadius:(CGFloat)eRadius
{
    UIBezierPath *bezierPathArc = [UIBezierPath bezierPath];
    
    //draw external/middle arc lines
    [bezierPathArc addArcWithCenter:self.centreP radius:iRadius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [bezierPathArc addArcWithCenter:self.centreP radius:eRadius startAngle:endAngle endAngle:startAngle clockwise:NO];
    
    //draw the last line by using arc drawing
    [bezierPathArc addArcWithCenter:self.centreP radius:iRadius startAngle:startAngle endAngle:startAngle clockwise:YES];
    
    [bezierPathArc setLineWidth:1.0];
    [strokeColor setStroke];
    [bezierPathArc stroke];
    
    //fill the color
    if (fillColor) {
        [fillColor setFill];
        [bezierPathArc fill];
    }
}

#pragma mark - Initialization

- (void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
