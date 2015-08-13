//
//  ViewController.m
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import "ViewController.h"
#import "MusicTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [[self view] addGestureRecognizer:tap];

}
-(void)hideKeyboard{

    [[self lbTextField] resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;

}


- (IBAction)searchButtonPressed:(id)sender {
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"songlistsegue"])
    {
        // Get reference to the destination view controller
        MusicTableViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setSong:self.lbTextField.text];
    }
}


@end
