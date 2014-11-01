//
//  PinchViewController.m
//  Fingercise
//
//  Created by James Lane on 10/31/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

// Local storage for game score
int scoreCounterPinch;

// output for game score
NSString *scoreOutputPinch;

// counter
int secondsCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    // Hide back button at first
    _backButtonPinch.hidden = YES;
    
    // Hide other smileys besides big one
    _smileyMedium.hidden = YES;
    _smileysemiLarge.hidden = YES;
    _smileySmall.hidden = YES;
   
    
    // Enable user interaction for the target images
    _smileyLarge.userInteractionEnabled = YES;
    _smileyMedium.userInteractionEnabled = YES;
    _smileysemiLarge.userInteractionEnabled = YES;
    _smileySmall.userInteractionEnabled = YES;
    
    
    
    
    // Set up the listeners
    _pincherLarge = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(largePinched:)];
    _pincherMedium = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(mediumPinched:)];
    _pincherSemiLarge = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(semiLargePinched:)];
    _pincherSmall = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(smallPinched:)];
    
    
    // Add the listeners in to the image views
    [self.smileyLarge addGestureRecognizer:_pincherLarge];
    _pincherLarge.cancelsTouchesInView = NO;
    // _targetTappedListener.delegate = self;
    
    [self.smileysemiLarge addGestureRecognizer:_pincherSemiLarge];
    _pincherSemiLarge.cancelsTouchesInView = NO;
    // _targetIndexTappedListener.delegate = self;
    
    [self.smileyMedium addGestureRecognizer:_pincherMedium];
    _pincherMedium.cancelsTouchesInView = NO;
    
    [self.smileySmall addGestureRecognizer:_pincherSmall];
    _pincherSmall.cancelsTouchesInView = NO;
    
    // start countdown
    [self setTimer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        _backButtonPinch.hidden = NO;
        
        // keep people from cheating
        _smileyLarge.userInteractionEnabled = NO;
        _smileyMedium.userInteractionEnabled = NO;
        _smileysemiLarge.userInteractionEnabled = NO;
        _smileySmall.userInteractionEnabled = NO;
       
        
        
    }
    
    
}

- (IBAction)largePinched:(UIPinchGestureRecognizer *)sender {
    
    
    _smileyLarge.hidden = YES;
    _smileysemiLarge.hidden = NO;
    scoreCounterPinch++;
    scoreOutputPinch = [NSString stringWithFormat:@"%2d",scoreCounterPinch];
    _scoreCountLabelPinch.text = scoreOutputPinch;
}
- (IBAction)semiLargePinched:(UIPinchGestureRecognizer *)sender {
    
    _smileysemiLarge.hidden = YES;
    _smileyMedium.hidden = NO;
    scoreCounterPinch++;
    scoreOutputPinch = [NSString stringWithFormat:@"%2d",scoreCounterPinch];
    _scoreCountLabelPinch.text = scoreOutputPinch;
    
}
- (IBAction)mediumPinched:(UIPinchGestureRecognizer *)sender {
    
    _smileyMedium.hidden = YES;
    _smileySmall.hidden = NO;
    scoreCounterPinch++;
    scoreOutputPinch = [NSString stringWithFormat:@"%2d",scoreCounterPinch];
    _scoreCountLabelPinch.text = scoreOutputPinch;
}
- (IBAction)smallPinched:(UIPinchGestureRecognizer *)sender {
    
    _smileySmall.hidden = YES;
    _smileyLarge.hidden = NO;
    scoreCounterPinch++;
    scoreOutputPinch = [NSString stringWithFormat:@"%2d",scoreCounterPinch];
    _scoreCountLabelPinch.text = scoreOutputPinch;
}
@end
