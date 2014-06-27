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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Log in state
-(void)toggleHiddenState:(BOOL)shouldHide
{
    self.lblEMail.hidden = shouldHide;
    self.lblUserName.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
    NSLog(@"toggleHiddenState: %i", shouldHide);
}

#pragma mark - FBDelegate
-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    // When user login.
    self.lblLoginStatus.text = @"You're Logged in.";
    [self toggleHiddenState:NO];
    NSLog(@"loginViewShowingLoggedInUser");
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    // When user info fetching..
    NSLog(@"%@",user);
    self.profilePicture.profileID = [user objectForKey:@"id"];
    self.lblUserName.text = user.name;
    self.lblEMail.text = [user objectForKey:@"email"];
    NSLog(@"loginViewFetchedUserInfo");
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.lblLoginStatus.text = @"You are logged out.";
    
    [self toggleHiddenState:YES];
    NSLog(@"loginViewShowingLoggedOutUser");
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
    NSLog(@"handleError");
}

@end
