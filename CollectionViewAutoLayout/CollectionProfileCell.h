//
//  CollectionProfileCell.h
//  Nekobiz
//
//  Created by Alvin Resmana on 2/16/15.
//  Copyright (c) 2015 nekobiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStarRatingView.h"
#import "UIColor+FlatUI.h"
#import "FUIButton.h"
#import "UIFont+FlatUI.h"
@interface CollectionProfileCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *itemButton;
@property (weak, nonatomic) IBOutlet UIButton *followerButton;
@property (weak, nonatomic) IBOutlet UIButton *followingButton;
@property (weak, nonatomic) IBOutlet FUIButton *testimonialButton;
@property (weak, nonatomic) IBOutlet FUIButton *editProfileButton;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet ASStarRatingView *starView;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;

@end
