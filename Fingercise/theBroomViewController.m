//
//  theBroomViewController.m
//  Fingercise
//
//  Created by James Lane on 10/30/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "theBroomViewController.h"

@interface theBroomViewController ()

@end

@implementation theBroomViewController

int theBroomScoreCount;

// output for game score
NSString *scoreOutputBroom;

int secondsCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Hide the back button
    _backButtonBroom.hidden = YES;
    
    // enable touching
    self.view.userInteractionEnabled = YES;
    
    // start the game timer
    [self setTimer];
    
    // initialize view with dirty roof
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roofDirty.jpg"]];
    
    // Set up the listeners
    _roofSwipedLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSweep:)];
    _roofSwipedRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRigthSweep:)];

    
    // Add the listeners in to the image views
    [self.view addGestureRecognizer:_roofSwipedLeft];
    _roofSwipedLeft.cancelsTouchesInView = NO;
    
    [self.view addGestureRecognizer:_roofSwipedRight];
    _roofSwipedRight.cancelsTouchesInView = NO;
}



-(void)setTimer{
    
    secondsCount = 20;
    _countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
}

-(void)startTimer{
    
    
    NSString *timerOutput = [NSString stringWithFormat:@"%d",secondsCount];
     secondsCount--;
    _timeLeftCount.text = timerOutput;
    
    // stop and set timer object to nothing once 0 has passed
    if(secondsCount == -1)
    {
        [_countdownTimer invalidate];
        _countdownTimer = nil;
        
        // reveal the back button
        _backButtonBroom.hidden = NO;
        
        // keep people from cheating
        self.view.userInteractionEnabled = NO;
   
        
    }
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showCleanRoofIfWon
{
    if(theBroomScoreCount >= 20)
    {
      self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roofClean.jpg"]];
    }
    // otherwise do nothing
}

- (IBAction)handleLeftSweep:(UISwipeGestureRecognizer *)sender {
    
    // earn half a point
    theBroomScoreCount++;
    scoreOutputBroom = [NSString stringWithFormat:@"%2d",theBroomScoreCount];
    _scoreCountLabelBroom.text = scoreOutputBroom;
    
     [self showCleanRoofIfWon];

   
    
}

- (IBAction)handleRigthSweep:(UISwipeGestureRecognizer *)sender {
    
    // earn half a point
    theBroomScoreCount++;
    scoreOutputBroom = [NSString stringWithFormat:@"%2d",theBroomScoreCount];
    _scoreCountLabelBroom.text = scoreOutputBroom;

     [self showCleanRoofIfWon];
    
}
@end
