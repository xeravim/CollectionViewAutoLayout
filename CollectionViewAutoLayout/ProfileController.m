//
//  ProfileController.m
//  Nekobiz
//
//  Created by Alvin Resmana on 2/16/15.
//  Copyright (c) 2015 nekobiz. All rights reserved.
//

#import "ProfileController.h"
#import "CollectionProductCell.h"
#import "CollectionProfileCell.h"


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))


#define IS_IPHONE_5_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
@interface ProfileController (){
    CGFloat bioHeight;
    CollectionProfileCell *_sizingCell;
}
@property (readwrite, nonatomic, strong) NSArray *products;
@property (readwrite, nonatomic, strong) NSString *ID;


@property UIRefreshControl *refreshControl;
@end

@implementation ProfileController

static NSString * const reuseIdentifier1 = @"CollectionProfileCell";
static NSString * const reuseIdentifier2 = @"CollectionProductCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier2];
    self.title=@"Profile";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    else{
        return 20;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        CollectionProfileCell *cell = (CollectionProfileCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier1 forIndexPath:indexPath];
        
        [self configureProfileCell:cell forIndexPath:indexPath];
        return cell;
    }
    else{
        CollectionProductCell *cell = (CollectionProductCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier2 forIndexPath:indexPath];
        NSInteger imageNumber=indexPath.row%2;
        [cell.backgroundImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",imageNumber]]];
        [cell.titleLabel setText:[NSString stringWithFormat:@"IDR 20.000.000"]];
        return cell;
    }
}
- (void)configureProfileCell:(CollectionProfileCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
   
    cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2;
    cell.profileImage.clipsToBounds = YES;
    cell.profileImage.layer.shouldRasterize = YES;
    cell.profileImage.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [cell.followingButton setTitle:[NSString stringWithFormat:@"100"] forState:UIControlStateNormal];
    [cell.followerButton setTitle:[NSString stringWithFormat:@"200"] forState:UIControlStateNormal];
    [cell.itemButton setTitle:[NSString stringWithFormat:@"20"] forState:UIControlStateNormal];
    
    [cell.itemButton addTarget:self action:@selector(itemTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.bioLabel setText:@"Description about yourself, who you are and what impact did you do to the environment. did you do to the environment. Description about yourself, who you are and what impact did you do to the environment. did you do to the environment. who you are and what impact did you do to the environment. did you do to the environment. who you are and what impact did you do to the environment. did you do to the environment."];
    [cell.bioLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [cell.bioLabel setNumberOfLines:0];

    [cell.profileImage setImage:[UIImage imageNamed:@"jobs.jpg"]];
    [cell.usernameLabel setText:[NSString stringWithFormat:@"stevejobs"]];

    [cell.nameLabel setText:[NSString stringWithFormat:@"Steve Jobs"]];
    [cell.websiteLabel setText:@"http://www.apple.com"];
    [cell.starView setCanEdit:NO];
    [cell.starView setMaxRating:5];
    [cell.starView setRating:3];
    
    [cell.starLabel setText:[NSString stringWithFormat:@"(10 Testimonials)"]];
   
}

#pragma mark <UICollectionViewDelegate>
// 1
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        // I need it can be calculated automatically based on bioLabel height
        if (IS_IPHONE_5_OR_LESS) {
            return CGSizeMake(320,290);
        }
        else if (IS_IPHONE_6){
            return CGSizeMake(374,270);
        }
    }
    else{
        if (IS_IPHONE_5_OR_LESS) {
            return CGSizeMake(105.6,105.6);
        }
        else if (IS_IPHONE_6){
            return CGSizeMake(124,124);
        }
        else{
            return CGSizeMake(137,137);
        }
    }
    return CGSizeMake(320,217);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section==0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    else{
        return UIEdgeInsetsMake(3, 1, 1, 1);
    }
   
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section==0) {
        return 0;
    }
    else{
        return 1;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0; // This is the minimum inter item spacing, can be more
}
/////////end of collectionview delegate

//scroll to specific section
- (void)itemTapped :(id)sender{
    [self scrollToSection:1];
}
- (void)scrollToSection:(NSUInteger)section
{
    if ([self.collectionView numberOfItemsInSection:section] > 0) {
        
        UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        
        CGRect sectionRect = CGRectMake(0, attributes.frame.origin.y -65, self.collectionView.frame.size.width, self.collectionView.frame.size.height); 
        
        [self.collectionView scrollRectToVisible:sectionRect animated:YES];
        
    } else {
        
        NSLog(@"no cell to scroll to");
    }
}


@end
