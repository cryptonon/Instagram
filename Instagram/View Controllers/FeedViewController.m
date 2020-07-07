//
//  FeedViewController.m
//  Instagram
//
//  Created by Aayush Mani Phuyal on 7/7/20.
//  Copyright © 2020 Aayush Phuyal. All rights reserved.
//

#import "FeedViewController.h"
#import <Parse/Parse.h>
#import "SceneDelegate.h"
#import "LoginViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// Logging out the user when Logout button is tapped
- (IBAction)onLogout:(id)sender {
    
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    sceneDelegate.window.rootViewController = loginViewController;
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {}];
}

@end
