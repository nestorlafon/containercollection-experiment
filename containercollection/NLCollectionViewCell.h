//
//  NLCollectionViewCell.h
//  containercollection
//
//  Created by Nestor Lafon-Gracia on 16/12/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIViewController *holdingViewController;

- (void)setupWithViewController:(UIViewController *)vc andParent:(UIViewController *)parentVC;
@end
