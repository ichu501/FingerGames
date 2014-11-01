//
//  DigitDanceViewController.h
//  Fingercise
//
//  Created by James Lane on 10/30/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DigitDanceViewController : UIViewController

// Outlets for targets
@property (strong, nonatomic) IBOutlet UIImageView *touchTarget;
@property (strong, nonatomic) IBOutlet UIImageView *touchTargetIndex;
@property (strong, nonatomic) IBOutlet UIImageView *touchTargetMiddle;
@property (strong, nonatomic) IBOutlet UIImageView *touchTargetRing;

// back button outlet
@property (strong, nonatomic) IBOutlet UIButton *backButton;





// Countdown before game is over
@property (strong, nonatomic) IBOutlet UILabel *timeLeftCount;
@property (strong, nonatomic) IBOutlet NSTimer *countdownTimer;

// outlet for score count label
@property (strong, nonatomic) IBOutlet UILabel *scoreCountLabel;


// methods to call when targets are tapped
- (IBAction)targetMiddleTapped:(UITapGestureRecognizer *)sender;
- (IBAction)targetIndexTapped:(UITapGestureRecognizer *)sender;
- (IBAction)targetTapped:(UITapGestureRecognizer *)sender;
- (IBAction)targetRingTapped:(UITapGestureRecognizer *)sender;

// Listeners for targets to be tapped
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *targetTappedListener;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *targetIndexTappedListener;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *targetMiddleTappedListener;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *targetRingTappedListener;




@end
