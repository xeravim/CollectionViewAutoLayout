//
//  CollectionProfileCell.m
//  Nekobiz
//
//  Created by Alvin Resmana on 2/16/15.
//  Copyright (c) 2015 nekobiz. All rights reserved.
//

#import "CollectionProfileCell.h"
#define UIColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/0xFF green:((float)((hexValue & 0xFF00) >> 8))/0xFF blue:((float)(hexValue & 0xFF))/0xFF alpha:1.0]
@implementation CollectionProfileCell


- (void)awakeFromNib
{
    self.editProfileButton.buttonColor = UIColorFromHex(0xF2F1F1);
    self.editProfileButton.shadowColor = UIColorFromHex(0xE6E5E5);
    self.editProfileButton.shadowHeight = 3.0f;
    self.editProfileButton.cornerRadius = 6.0f;
    self.editProfileButton.titleLabel.font = [UIFont boldFlatFontOfSize:12];
    [self.editProfileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.editProfileButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    self.testimonialButton.buttonColor = UIColorFromHex(0xF2F1F1);
    self.testimonialButton.shadowColor = UIColorFromHex(0xE6E5E5);
    self.testimonialButton.shadowHeight = 3.0f;
    self.testimonialButton.cornerRadius = 6.0f;
    
    [self.testimonialButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.testimonialButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}


@end
