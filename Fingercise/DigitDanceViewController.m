//
//  DigitDanceViewController.m
//  Fingercise
//
//  Created by James Lane on 10/30/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "DigitDanceViewController.h"

@interface DigitDanceViewController ()

@end

@implementation DigitDanceViewController


// Local storage for game score
int scoreCounterDigitDance;

// output for game score
NSString *scoreOutput;

// counter
int secondsCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Hide all the targets at first
    _touchTarget.hidden = YES;
    _touchTargetIndex.hidden = YES;
    _touchTargetMiddle.hidden = YES;
    _touchTargetRing.hidden = YES;
    
    // Hide back button
    _backButton.hidden = YES;
    
    
    // Enable user interaction for the target images
    _touchTarget.userInteractionEnabled = YES;
     _touchTargetIndex.userInteractionEnabled = YES;
     _touchTargetMiddle.userInteractionEnabled = YES;
     _touchTargetRing.userInteractionEnabled = YES;
    
    
    // Set up the listeners
    _targetTappedListener = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(targetTapped:)];
    _targetMiddleTappedListener = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(targetMiddleTapped:)];
    _targetIndexTappedListener = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(targetIndexTapped:)];
    _targetRingTappedListener = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(targetRingTapped:)];
    
    
    // Add the listeners in to the image views
    [self.touchTarget addGestureRecognizer:_targetTappedListener];
    _targetTappedListener.cancelsTouchesInView = NO;
    // _targetTappedListener.delegate = self;
    
    [self.touchTargetIndex addGestureRecognizer:_targetIndexTappedListener];
    _targetIndexTappedListener.cancelsTouchesInView = NO;
    // _targetIndexTappedListener.delegate = self;
    
    [self.touchTargetMiddle addGestureRecognizer:_targetMiddleTappedListener];
    _targetMiddleTappedListener.cancelsTouchesInView = NO;

  
    
    [self.touchTargetRing addGestureRecognizer:_targetRingTappedListener];
    _targetRingTappedListener.cancelsTouchesInView = NO;

   
    // start the countdown. You got 20 seconds!
    [self setTimer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTimer{

    // Timer with 0.5 second intervals
    secondsCount = 20;
    _countdownTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
}

-(void)startTimer{

    NSString *timerOutput = [NSString stringWithFormat:@"%2d",secondsCount];
    secondsCount--;
    _timeLeftCount.text = timerOutput;
    
    // Start the game
    [self startTheExercise];
    
    // stop and set timer object to nothing once 0 has passed
    if(secondsCount == -1)
    {
        [_countdownTimer invalidate];
        _countdownTimer = nil;
        
        // reveal the back button
        _backButton.hidden = NO;
        
        // disable the targets to keep people from cheating
        _touchTarget.userInteractionEnabled = NO;
        _touchTargetIndex.userInteractionEnabled = NO;
        _touchTargetMiddle.userInteractionEnabled = NO;
        _touchTargetRing.userInteractionEnabled = NO;
        
    }
    
   
    
    // send the score and player name to the server
    [self sendToServer];
    
}

-(void)sendToServer
{
    
}


// start the target animation
-(void)startTheExercise
{
    
    if(secondsCount == 20)
    {
        _touchTarget.hidden = NO;
}
    else if(secondsCount == 19)
    {
        _touchTarget.hidden = YES;
        _touchTargetIndex.hidden = NO;
  }
    else if(secondsCount == 18)
    {
        _touchTargetIndex.hidden = YES;
        _touchTargetMiddle.hidden = NO;
    }
    else if(secondsCount == 17)
    {
        _touchTargetMiddle.hidden = YES;
        _touchTargetRing.hidden = NO;
     }
    else if(secondsCount == 16)
    {
        _touchTargetRing.hidden = YES;
        _touchTargetMiddle.hidden = NO;
   }
    else if(secondsCount == 15)
    {
        _touchTargetMiddle.hidden = YES;
        _touchTargetIndex.hidden = NO;
     }
    else if(secondsCount == 14)
    {
        _touchTargetIndex.hidden = YES;
        _touchTarget.hidden = NO;
  
    }
    else if(secondsCount == 13)
    {
        _touchTarget.hidden = YES;
        _touchTargetRing.hidden = NO;
      }
    else if(secondsCount == 12)
    {
        _touchTargetRing.hidden = YES;
        _touchTargetIndex.hidden = NO;
       }
    else if(secondsCount == 11)
    {
        _touchTargetIndex.hidden = YES;
        _touchTarget.hidden = NO;
  }
    else if(secondsCount == 10)
    {
        _touchTarget.hidden = YES;
        _touchTargetMiddle.hidden = NO;
  }
    else if(secondsCount == 9)
    {
        _touchTargetMiddle.hidden = YES;
        _touchTargetRing.hidden = NO;
       }
    else if(secondsCount == 8)
    {
        _touchTargetRing.hidden = YES;
        _touchTarget.hidden = NO;
    
    }
    else if(secondsCount == 7)
    {
        _touchTarget.hidden = YES;
        _touchTargetMiddle.hidden = NO;
     }
    else if(secondsCount == 6)
    {
        _touchTargetMiddle.hidden = YES;
        _touchTargetIndex.hidden = NO;
        _scoreCountLabel.text = scoreOutput; }
    else if(secondsCount == 5)
    {
        _touchTargetIndex.hidden = YES;
        _touchTargetRing.hidden = NO;
     }
    else if(secondsCount == 4)
    {
        _touchTargetRing.hidden = YES;
        _touchTarget.hidden = NO;
     }
    else if(secondsCount == 3)
    {
        _touchTarget.hidden = YES;
        _touchTargetMiddle.hidden = NO;
        }
    else if(secondsCount == 2)
    {
        _touchTargetMiddle.hidden = YES;
        _touchTargetIndex.hidden = NO;
    }
    else if(secondsCount == 1)
    {
        _touchTargetIndex.hidden = YES;
        _touchTargetRing.hidden = NO;
        }
    else
    {
        _touchTargetIndex.hidden = NO;
        _touchTargetRing.hidden = NO;
        _touchTarget.hidden = NO;
        _touchTargetMiddle.hidden = NO;
    }
}

// when target for swearing finger is tapped
- (IBAction)targetMiddleTapped:(UITapGestureRecognizer *)sender {
     // earn a point
    scoreCounterDigitDance++;
    scoreOutput = [NSString stringWithFormat:@"%2d",scoreCounterDigitDance];
    _scoreCountLabel.text = scoreOutput;
    
}

// when target for index finger is tapped
- (IBAction)targetIndexTapped:(UITapGestureRecognizer *)sender {
     // earn a point
    scoreCounterDigitDance++;
    scoreOutput = [NSString stringWithFormat:@"%2d",scoreCounterDigitDance];
    _scoreCountLabel.text = scoreOutput;
}

// when target for the thumb is tapped
- (IBAction)targetTapped:(UITapGestureRecognizer *)sender {
    // earn a point
    scoreCounterDigitDance++;
    scoreOutput = [NSString stringWithFormat:@"%2d",scoreCounterDigitDance];
    _scoreCountLabel.text = scoreOutput;
}

// when target for the ring finger is tapped
- (IBAction)targetRingTapped:(UITapGestureRecognizer *)sender {
     // earn a point
    scoreCounterDigitDance++;
    scoreOutput = [NSString stringWithFormat:@"%2d",scoreCounterDigitDance];
    _scoreCountLabel.text = scoreOutput;
}
- (IBAction)backButtonPressed:(id)sender {
}
@end
