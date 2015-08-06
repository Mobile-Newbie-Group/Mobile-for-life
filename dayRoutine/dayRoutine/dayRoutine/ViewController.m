//
//  ViewController.m
//  dayRoutine
//
//  Created by James chan on 3/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) Grid *gameGrid;
@property (strong, nonatomic) IBOutlet UIView *gameView;

@end

@implementation ViewController


- (Grid *)gameGrid
{
    if (!_gameGrid){
        _gameGrid = [[Grid alloc] init];
        _gameGrid.cellAspectRatio =  ASPECT_RATIO;
    }
    return _gameGrid;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self initiateData];
}

- (void)initiateData
{
    self.gameView = [[UIView alloc] initWithFrame:CGRectMake(5, TOP_NAVIGATION_BAR_HEIGHT , self.view.frame.size.width, self.view.frame.size.height - TOP_NAVIGATION_BAR_HEIGHT - BOTTOM_TAB_BAR_HEIGHT)];
    
    self.gameGrid.minimumNumberOfCells = 1;
    self.gameGrid.size = self.view.bounds.size;
    
    
   // NSLog(@"%f,%f",self.gameGrid.size.height,self.gameView.frame.origin.y);
    
   for (int row = 0; row < [self.gameGrid rowCount]; row++)
       for (int col = 0; col < [self.gameGrid columnCount]; col++){
           CGRect frame =  [self.gameGrid frameOfCellAtRow:row inColumn:col];
        
            RoutineView *rv = [[RoutineView alloc] initWithFrame:frame];
            
            rv.pic = [UIImage imageNamed:@"pic"];
            rv.activities = [NSMutableArray arrayWithObjects: @"0", @"7", @"睡觉", @"0",
                             @"7", @"7.5", @"散步", @"3",
                             @"7.5", @"8", @"早餐", @"1",
                             @"8", @"9.5", @"工作", @"2",
                             @"9.5", @"10.5",@"读信件", @"4",
                             @"10.5", @"12", @"工作", @"2",
                             @"12", @"12.5", @"", @"3",
                             @"12.5", @"13", @"午餐", @"1",
                             @"13", @"14",@"读报纸", @"4",
                             @"14", @"15",@"写信", @"4",
                             @"15", @"16", @"打盹", @"0",
                             @"16", @"16.5", @"散步", @"3",
                             @"16.5", @"17.5",@"轻松工作", @"4",
                             @"17.5", @"18",@"闲着", @"1",
                             @"18", @"19",@"读小说", @"1",
                             @"19", @"20",@"吃茶&鸡蛋", @"1",
                             @"20", @"21",@"下棋", @"1",
                             @"21", @"22",@"读自然书", @"4",
                             @"22", @"24",@"床上想问题", @"2",nil];
        
            rv.title = @"达尔文";
            rv.subTitle = @"C.1842-1859";
    
            [self.view addSubview:rv];
   }
    
    //[self.view addSubview:self.gameView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
