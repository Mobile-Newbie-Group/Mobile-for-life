//
//  ViewController.m
//  dayRoutine
//
//  Created by James chan on 3/8/15.
//  Copyright (c) 2015 James` Awesome App House. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong,nonatomic) Grid *gameGrid;
@property (strong,nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) IBOutlet UIView *profileView;

@property (nonatomic) NSMutableArray *testPack;
@property (nonatomic) NSInteger selectedIndex;





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

//handling the segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue isKindOfClass:[UIStoryboardSegue class]]) {
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]) {
            DetailViewController *detail = (DetailViewController *) segue.destinationViewController;
            
            NSLog (@"%ld",self.selectedIndex * 3);
            
            detail.name = self.testPack[self.selectedIndex * 3];
            detail.subTitle = self.testPack[self.selectedIndex * 3+1];
            detail.activities = self.testPack[self.selectedIndex * 3 +2];
            self.selectedIndex = PAGE_LAYOUT_MAX_NUMBER;
        }
    }
}

#pragma mark - Gesture Handling

- (IBAction)flip:(UITapGestureRecognizer *)sender {
    
    //get the index of selected pic
    CGPoint index = [sender locationInView:self.gameView];
    
    //if tapping the the profile pic, display the last file
    if (index.x > self.gameView.frame.origin.x + self.gameView.frame.size.width &&
        index.y > self.gameView.frame.origin.y +self.gameView.frame.size.height){
        
        self.selectedIndex = [self.testPack count]/3 -1;
        
    }else {
    
        for (int row = 0; row < [self.gameGrid rowCount]; row++)
            for (int col = 0; col < [self.gameGrid columnCount]; col++){
                
                CGRect frame =  [self.gameGrid frameOfCellAtRow:row inColumn:col];
                
                if (frame.origin.x < index.x && index.x < frame.origin.x + frame.size.width &&
                    frame.origin.y < index.y && index.y < frame.origin.y + frame.size.height) {
                    self.selectedIndex = row * [self.gameGrid columnCount] + col;
                    break;
                }
            }
    }

    [self performSegueWithIdentifier:@"Show Detail" sender:sender];
    
}

#pragma mark - page loading

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)awakeFromNib
{
    
    //get defined color
    RoutineView *rv = [[RoutineView alloc] initWithFrame:self.view.frame];
    
    //set UINavigationBar background
    [[UINavigationBar appearance] setBarTintColor:[rv getDefinedColor:2]];
    
    //set tint color
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //set UINavigationBar text
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor],
      NSForegroundColorAttributeName,
      [UIColor whiteColor],
      NSForegroundColorAttributeName,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
      NSForegroundColorAttributeName,
      [UIFont fontWithName:@"Chalkduster" size:15.0],
      NSFontAttributeName,
      nil]];

    //set UITabBar
    //[[UITabBar appearance] setBarTintColor:[rv getDefinedColor:5]];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self initiateData];
}

#pragma mark - initiate the testing data

- (void)initiateData
{
    [self loadPack];
    
    self.gameGrid.minimumNumberOfCells = 6;
    //PAGE_LAYOUT_MAX_NUMBER >[self.testPack count]/3 ? [self.testPack count]/3 : PAGE_LAYOUT_MAX_NUMBER ;
    
    self.gameGrid.size = CGRectMake(0, TOP_NAVIGATION_BAR_HEIGHT , self.view.frame.size.width * 2 /3 , self.gameView.frame.size.height).size;
    
    
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
    
    //add profile at the bottom right
    RoutineView *rv = [[RoutineView alloc] initWithFrame:self.profileView.frame]; //CGRectMake(213,349,107,107)
    NSInteger index = [self.testPack count] -1;
    rv.title = self.testPack[index-2];
    rv.subTitle = self.testPack[index-1];
    rv.activities = self.testPack[index];
    rv.pic = [UIImage imageNamed:rv.title];
    
    [self.view addSubview:rv];
    [self.view addSubview:self.profileView];
    
}

//input data
- (void)loadPack
{
    if (!_testPack) _testPack = [[NSMutableArray alloc] init];
    
    //the pic must be the same as name with a first capital letter
   
    [_testPack addObject: @"Darwin"];
    [_testPack addObject: @"1809 - 1882"];
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

    
    [_testPack addObject: @"Eva"];
    [_testPack addObject: @"C.2015"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"0.5", @"8", @"sleeping", @"0",
                           @"8", @"8.5", @"reading news", @"1",
                           @"8.5", @"9", @"washing then take a metro", @"3",
                           @"9", @"11.5", @"working", @"2",
                           @"11.5", @"12.5", @"lunch,chat", @"1",
                           @"12.5", @"13.5", @"snap", @"1",
                           @"13.5", @"18",@"working", @"2",
                           @"18", @"19", @"supper,chat with friends", @"1",
                           @"19", @"21", @"'study nite' time", @"4",
                           @"21", @"23", @"watch TV", @"1",
                           @"23", @"24", @"wechat,reading", @"3",
                           @"0", @"0.5", @"play candy crash to fall asleep", @"1",nil]];

    
    [_testPack addObject: @"Hao"];
    [_testPack addObject: @"~Old Enough~"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"0", @"0.5", @"", @"3",
                           @"0.5", @"3", @"In Another World", @"0",
                           @"3", @"3.5", @"ewwww!", @"4",
                           @"3.5", @"7", @"In Another World", @"0",
                           @"7", @"8", @"Read", @"3",
                           @"8", @"8.5", @"Fighting on bus", @"1",
                           @"8.5", @"11.5", @"Work on the Earth", @"2",
                           @"11.5", @"12.5", @"Lunch With Earth Buddies", @"1",
                           @"12.5", @"13.5",@"", @"3",
                           @"13.5", @"17.5", @"Work on the Earth", @"2",
                           @"17.5", @"21", @"Yabadabadooo!", @"1",
                           @"21", @"23.5",@"Meeting", @"2",
                           @"23.5", @"24",@"Read", @"3",nil]];
    
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
    
    [_testPack addObject: @"Steven"];
    [_testPack addObject: @"Calendar"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"7", @"8", @"read news time,breakfast",@"1",
                           @"8", @"9", @"on the way to office",@"3",
                           @"9", @"12", @"working",@"2",
                           @"12", @"13", @"lunch",@"1",
                           @"13", @"18", @"working", @"2",
                           @"18.5", @"19.5",@"dinner with family", @"1",
                           @"20", @"22.5", @"meeting time", @"2",
                           @"22.5", @"23.5", @"reading,relax", @"4",
                           @"23.5", @"4.5", @"sleep", @"0",
                           @"4.5", @"5.5",@"thinking", @"3",
                           @"5.5", @"7", @"sleep",@"0",nil]];

    
    [_testPack addObject: @"Xiaodong"];
    [_testPack addObject: @"Busy Friday"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"0", @"7", @"Sleeping", @"0",
                           @"7", @"7.5", @"Breakfast", @"1",
                           @"7.5", @"9", @"Bus to office", @"2",
                           @"9", @"11.5", @"Working", @"2",
                           @"11.5", @"12",@"Lunch", @"1",
                           @"12", @"13", @"Rest", @"0",
                           @"13", @"14", @"Working", @"2",
                           @"14", @"17", @"Meeting", @"2",
                           @"17", @"17.5",@"Break", @"1",
                           @"17.5", @"18",@"Bus to gym", @"4",
                           @"18", @"21", @"Bodybuilding", @"3",
                           @"21", @"22.5", @"Go home", @"4",
                           @"22.5", @"23.5",@"Night snack", @"1",
                           @"23.5", @"24",@"Shower", @"1",nil]];
    
    [_testPack addObject: @"Franklin"];
    [_testPack addObject: @"C.1771"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"5", @"8", @"think about what to do today", @"1",
                           @"8", @"12", @"working", @"2",
                           @"12", @"14", @"reading,check account book,lunch", @"1",
                           @"14", @"18",@"working", @"2",
                           @"18", @"20", @"supper,music,chat,entertainment", @"3",
                           @"20", @"22", @"think about what did well today", @"1",
                           @"22", @"29", @"sleeping", @"0",nil]];
    
    
    [_testPack addObject: @"Gary"];
    [_testPack addObject: @"One day in Shenzhen"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
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
                           @"21", @"22", @"?handle notes", @"5",
                           @"22", @"23", @"?drink", @"5",
                           @"23", @"24", @"?sleep", @"5",nil]];
    
    [_testPack addObject: @"Alex"];
    [_testPack addObject: @"Good day"];
    [_testPack addObject: [NSMutableArray arrayWithObjects:
                           @"1", @"8", @"sleeping", @"0",
                           @"8", @"8.5", @"Wash up", @"1",
                           @"8.5", @"9", @"Drive to office", @"2",
                           @"9", @"11.5", @"working", @"2",
                           @"11.5", @"12.5", @"lunch,chat", @"1",
                           @"12.5", @"18",@"working", @"2",
                           @"18", @"18.5", @"Drive back home", @"2",
                           @"18.5", @"20", @"Play with my son", @"4",
                           @"20", @"22", @"Conference Call", @"2",
                           @"22", @"23", @"Road Running", @"3",
                           @"23", @"23.5", @"Shower", @"1",
                           @"23.5", @"1", @"Relax", @"1",nil]];
    
    
    NSMutableDictionary *testDict = [[NSMutableDictionary alloc] init];
    
    [testDict setObject:@"Darwin" forKey:ROUTINE_PROFILE_NAME];
    [testDict setObject:@"1809 - 1882" forKey:ROUTINE_PROFILE_DESCRIPTION];
    [testDict setObject:@"Darwin@noemail" forKey:ROUTINE_PROFILE_ACCOUNT];
    NSData *pic =  UIImagePNGRepresentation([UIImage imageNamed:@"Darwin"]);
    [testDict setObject:pic forKey:ROUTINE_PROFILE_PIC];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //input profile data
    [Profile profileWithDictionary:testDict
            inManagedObjectContext:appDelegate.managedObjectContext];
    
    //input activity data
    for (int i = 0; i < [_testPack[2] count]/4; i++){
        [testDict setObject:_testPack[2][0+i*4] forKey:ROUTINE_ACTIVITY_START];
        [testDict setObject:_testPack[2][1+i*4] forKey:ROUTINE_ACTIVITY_END];
        [testDict setObject:_testPack[2][2+i*4]  forKey:ROUTINE_ACTIVITY_CONTENT];
        
        UIColor* value = [self getDefinedColor: [_testPack[2][3+i*4] integerValue]];
        [testDict setObject:value forKey:ROUTINE_COLOR_VALUE];

        [testDict setObject:_testPack[2][3+i*4] forKey:ROUTINE_COLOR_TAG];
        
        [Activity ActivityWithDictionary:testDict
                           withAccountID:@"Darwin@noemail"
                  inManagedObjectContext:appDelegate.managedObjectContext];
        
    }
    
    [appDelegate saveContext];
    
}

- (UIColor*) getDefinedColor :(NSUInteger) number
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
    }if (number == 5){
        return [UIColor lightGrayColor] ;
    }else
        return nil;
}



@end
