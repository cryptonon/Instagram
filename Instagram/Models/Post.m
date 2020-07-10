//
//  Post.m
//  Instagram
//
//  Created by Aayush Mani Phuyal on 7/7/20.
//  Copyright © 2020 Aayush Phuyal. All rights reserved.
//

#import "Post.h"

@implementation Post

// Declaring all properties as @dynamic
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

// Class method for posting image to parse database
+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];
}

// Class method for making PFFileObject from UIImage
+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
    if (!image) return nil;
    NSData *imageData = UIImagePNGRepresentation(image);
    if (!imageData) return nil;

    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

# pragma mark - Delegate Methods

// Required delegate method for conforming to PFSubclassing protocol
+ (nonnull NSString *)parseClassName {
    return @"Post";
}

@end
