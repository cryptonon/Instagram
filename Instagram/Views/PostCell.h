//
//  PostCell.h
//  Instagram
//
//  Created by Aayush Mani Phuyal on 7/7/20.
//  Copyright © 2020 Aayush Phuyal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

//MARK: Properties
@property (nonatomic, strong) Post *post;

@end

NS_ASSUME_NONNULL_END
