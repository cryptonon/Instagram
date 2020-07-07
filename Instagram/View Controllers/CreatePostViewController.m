//
//  CreatePostViewController.m
//  Instagram
//
//  Created by Aayush Mani Phuyal on 7/7/20.
//  Copyright © 2020 Aayush Phuyal. All rights reserved.
//

#import "CreatePostViewController.h"
#import "Post.h"

@interface CreatePostViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// MARK: Properties
@property (weak, nonatomic) IBOutlet UIImageView *postingImageView;
@property (weak, nonatomic) IBOutlet UITextField *captionLabel;

@end

@implementation CreatePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        NSLog(@"Camera unavailable so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}

// Method to resize the captured image
- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    
    UIImageView *resizedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizedImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizedImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizedImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

// Method to dismiss modal view on tapping Cancel button
- (IBAction)onCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Method to post image to parse on tapping Share button
- (IBAction)onShare:(id)sender {
    [Post postUserImage:self.postingImageView.image withCaption:self.captionLabel.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"Posted!");
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

# pragma mark - Delegate Methods

// UIImagePickerController's Delegate method to get and process captured image locally
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    self.postingImageView.image = [self resizeImage:editedImage withSize:CGSizeMake(399, 399)];

    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
