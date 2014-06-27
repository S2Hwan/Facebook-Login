//
//  ViewController.m
//  Facebook Login
//
//  Created by Bilal ARSLAN on 26/06/14.
//
//

#import "ViewController.h"

@interface ViewController ()

-(void)toggleHiddenState:(BOOL)shouldHide;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self toggleHiddenState:YES];
    [[self lblLoginStatus] setText:@""];
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
}


-(void)toggleHiddenState:(BOOL)shouldHide
{
    self.lblEMail.hidden = shouldHide;
    self.lblUserName.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
