//
//  ThirdViewController.m
//  Fingercise
//
//  Created by James Lane on 10/30/14.
//  Copyright (c) 2014 James Lane. All rights reserved.
//

#import "ThirdViewController.h"


@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load the user settings from NSUserDefaults
    [self loadUserSettings];
    
  
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// save the settings and display saved message
- (IBAction)saveButtonPressed:(id)sender {

    [self saveUserSettings];
    
}


- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}


// Use NSUserDefaults for player name and score data persistence
- (void)loadUserSettings {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    _nameTextField.text = [userDefaults objectForKey:@"nameField"];
    
    [userDefaults synchronize];
}

// close the keyboard is background is touched
- (IBAction)backgroundClicked:(id)sender {
    
      [self.nameTextField resignFirstResponder];
}

// Use NSUserDefaults for player name and score data persistence
- (void)saveUserSettings {
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if(_nameTextField.text)
    {
        [userDefaults setObject:_nameTextField.text forKey:@"nameField"];
        NSLog(@"Player name saved");
        
        // Send player name to server
        
        
    }
    
    [userDefaults synchronize];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
