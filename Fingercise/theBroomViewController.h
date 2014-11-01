//
//  theBroomViewController.h
//  Fingercise
//
//  Created by James Lane on 10/30/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface theBroomViewController : UIViewController

// back button
@property (strong, nonatomic) IBOutlet UIButton *backButtonBroom;

// handlers for left and right sweep
- (IBAction)handleLeftSweep:(UISwipeGestureRecognizer *)sender;
- (IBAction)handleRigthSweep:(UISwipeGestureRecognizer *)sender;

// Listeners for sweeping motion
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *roofSwipedLeft;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *roofSwipedRight;

@property (strong, nonatomic) IBOutlet UILabel *scoreCountLabelBroom;

// Countdown before game is over
@property (strong, nonatomic) IBOutlet UILabel *timeLeftCount;
@property (strong, nonatomic) IBOutlet NSTimer *countdownTimer;


@end
