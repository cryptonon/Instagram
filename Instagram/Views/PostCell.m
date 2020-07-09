//
//  PostCell.m
//  Instagram
//
//  Created by Aayush Mani Phuyal on 7/7/20.
//  Copyright © 2020 Aayush Phuyal. All rights reserved.
//

#import "PostCell.h"
@import Parse;


@interface PostCell()

// MARK: Properties
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAgoLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;

@end

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

// Setter Method that sets PostCell's post property
- (void)setPost:(Post *)post {
    _post = post;
    self.usernameLabel.text = self.post.author.username;
    self.captionLabel.text = self.post.caption;
    self.createdAgoLabel.text = [NSString stringWithFormat:@"%@", self.post.createdAt];
    self.photoImageView.file = post.image;
    [self.photoImageView loadInBackground];
}

@end
