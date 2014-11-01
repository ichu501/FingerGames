//
//  PinchViewController.h
//  Fingercise
//
//  Created by James Lane on 10/31/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinchViewController : UIViewController

// Countdown before game is over
@property (strong, nonatomic) IBOutlet UILabel *timeLeftCount;
@property (strong, nonatomic) IBOutlet NSTimer *countdownTimer;

@property (strong, nonatomic) IBOutlet UIImageView *smileyLarge;
@property (strong, nonatomic) IBOutlet UIImageView *smileysemiLarge;
@property (strong, nonatomic) IBOutlet UIImageView *smileyMedium;
@property (strong, nonatomic) IBOutlet UIImageView *smileySmall;

@property (strong, nonatomic) IBOutlet UILabel *scoreCountLabelPinch;
@property (strong, nonatomic) IBOutlet UIButton *backButtonPinch;

@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pincherLarge;
- (IBAction)largePinched:(UIPinchGestureRecognizer *)sender;

@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pincherSemiLarge;
- (IBAction)semiLargePinched:(UIPinchGestureRecognizer *)sender;

@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pincherMedium;
- (IBAction)mediumPinched:(UIPinchGestureRecognizer *)sender;

@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pincherSmall;
- (IBAction)smallPinched:(UIPinchGestureRecognizer *)sender;

@end
