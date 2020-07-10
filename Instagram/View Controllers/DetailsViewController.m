//
//  DetailsViewController.m
//  Instagram
//
//  Created by Aayush Mani Phuyal on 7/9/20.
//  Copyright © 2020 Aayush Phuyal. All rights reserved.
//

#import "DetailsViewController.h"
#import "NSDate+DateTools.h"
@import Parse;

@interface DetailsViewController ()

// MARK: Properties
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAgoLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewProperties];
}

// Method that sets DetailsViewController's Properties
- (void)setViewProperties {
    self.usernameLabel.text = self.post.author.username;
    self.captionLabel.text = self.post.caption;
    self.createdAgoLabel.text = [self.post.createdAt shortTimeAgoSinceNow];
    self.photoImageView.file = self.post.image;
    [self.photoImageView loadInBackground];
}

@end
