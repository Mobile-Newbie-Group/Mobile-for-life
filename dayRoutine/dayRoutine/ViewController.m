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

@property (nonatomic) NSMutableArray *testPack;

@end

@implementation ViewController

- (NSMutableArray*) testPack
{
    if(!_testPack) _testPack = [[NSMutableArray alloc] init];
    return _testPack;
}

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
    [self loadPack];
    
    [self.gameView removeFromSuperview];
    self.gameView = [[UIView alloc] initWithFrame:CGRectMake(HORIZON_SPACE, TOP_NAVIGATION_BAR_HEIGHT , self.view.frame.size.width - 2 * HORIZON_SPACE, self.view.frame.size.height - TOP_NAVIGATION_BAR_HEIGHT - BOTTOM_TAB_BAR_HEIGHT)];
    
    self.gameGrid.minimumNumberOfCells =
    PAGE_LAYOUT_MAX_NUMBER >[self.testPack count]/3 ? [self.testPack count]/3 : PAGE_LAYOUT_MAX_NUMBER ;
    
    self.gameGrid.size = self.view.bounds.size;
    
    for (int row = 0; row < [self.gameGrid rowCount]; row++)
       for (int col = 0; col < [self.gameGrid columnCount]; col++){
           CGRect frame =  [self.gameGrid frameOfCellAtRow:row inColumn:col];
           
           NSInteger index = row * [self.gameGrid columnCount] + col;
           if (index >= self.gameGrid.minimumNumberOfCells) break;
           
           RoutineView *rv = [[RoutineView alloc] initWithFrame:frame];
        
           rv.title = self.testPack[index * 3];
           rv.subTitle = self.testPack[index * 3+1];
           rv.activities = self.testPack[index * 3+2];
           rv.pic = [UIImage imageNamed:rv.title];
           
       [self.gameView addSubview:rv];
    }
    [self.view addSubview:self.gameView];
}

//input data
- (void)loadPack
{
    if (!_testPack) _testPack = [[NSMutableArray alloc] init];
    
    //the pic must be the same as name with a first capital letter
    [_testPack addObject: @"Darwin"];
    [_testPack addObject: @"C.1809 - 1882"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"0", @"7", @"sleeping", @"0",
                           @"7", @"7.5", @"walking", @"3",
                           @"7.5", @"8", @"breakfast", @"1",
                           @"8", @"9.5", @"work", @"2",
                           @"9.5", @"10.5",@"reading mail", @"4",
                           @"10.5", @"12", @"work", @"2",
                           @"12", @"12.5", @"rest", @"3",
                           @"12.5", @"13", @"lunch", @"1",
                           @"13", @"14",@"reading news paper", @"4",
                           @"14", @"15",@"writing mail", @"4",
                           @"15", @"16", @"sleeping", @"0",
                           @"16", @"16.5", @"walking", @"3",
                           @"16.5", @"17.5",@"relaxing work", @"4",
                           @"17.5", @"18",@"do nothing", @"1",
                           @"18", @"19",@"reading books", @"1",
                           @"19", @"20",@"have tea&eggs", @"1",
                           @"20", @"21",@"play chess", @"1",
                           @"21", @"22",@"read books", @"4",
                           @"22", @"24",@"laying on bed and thinking", @"2",nil]];
    
    [_testPack addObject: @"Gary"];
    [_testPack addObject: @"One day in Shenzhen"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"0", @"5", @"?sleep", @"0",
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
                           @"21", @"22", @"?handle notes", @"3",
                           @"22", @"23", @"?drink", @"3",
                           @"23", @"24", @"?sleep", @"0",nil]];
    
    [_testPack addObject: @"Hao"];
    [_testPack addObject: @"~Old Enough~"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"0", @"0.5", @"", @"3",
                           @"0.5", @"7.5", @"Sleep", @"0",
                           @"7.5", @"8.5", @"Read", @"3",
                           @"8.5", @"11.5", @"Work", @"2",
                           @"11.5", @"12.5", @"Lunch", @"1",
                           @"12.5", @"13.5",@"Read", @"3",
                           @"13.5", @"17.5", @"Work", @"2",
                           @"17.5", @"21", @"Social", @"1",
                           @"21", @"23",@"Work", @"2",
                           @"23", @"24",@"∞Read", @"3",nil]];
    
    [_testPack addObject: @"James"];
    [_testPack addObject: @"Fancy iOS development"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"23.5", @"7.5", @"sleep",@"0",
                           @"7.5", @"8", @"body building",@"3",
                           @"8", @"8.5", @"breakfast",@"1",
                           @"8.5", @"9.5", @"going to work",@"2",
                           @"9.5", @"11.5", @"work", @"2",
                           @"11.5", @"12.5",@"lunch", @"1",
                           @"12.5", @"13.5", @"rest", @"0",
                           @"13.5", @"15.5", @"work", @"2",
                           @"15.5", @"16", @"relaxing", @"4",
                           @"16", @"17.5",@"work", @"2",
                           @"17.5", @"18.5", @"going home",@"1",
                           @"18.5", @"19.5", @"dinner", @"1",
                           @"19.5", @"21.5", @"programming", @"4",
                           @"21.5", @"22", @"sports", @"3",
                           @"22", @"22.5", @"shower", @"3",
                           @"22.5", @"23.5",@"reading", @"4",nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
