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
#import "PostCell.h"

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate>

// MARK: Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *postsArray;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchPosts];
}

// Method to fetch posts from parse
- (void) fetchPosts {
    
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.postsArray = posts;
            [self.tableView reloadData];
        }
    }];
}


// Logging out the user when Logout button is tapped
- (IBAction)onLogout:(id)sender {
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (!error) {
            SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            sceneDelegate.window.rootViewController = loginViewController;
        }
    }];
}

# pragma mark - Delegate Methods

// Method to configure the Table View's cell (Table View Data Source's required method)
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    PostCell *post = self.postsArray[indexPath.row];
    cell.post = (Post *) post;
    
    return cell;
}

// Method to find out the number of rows in Table View (Table View Data Source's required method)
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postsArray.count;
}

@end
