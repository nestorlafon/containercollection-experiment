//
//  NLCollectionViewCell.m
//  containercollection
//
//  Created by Nestor Lafon-Gracia on 16/12/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import "NLCollectionViewCell.h"
#import "NLCardViewController.h"

@interface NLCollectionViewCell ()
@property (strong, nonatomic) UIViewController *containedViewController;
@end

@implementation NLCollectionViewCell

- (void)setupWithViewController:(UIViewController *)vc andParent:(UIViewController *)parentVC {
    if (!self.containedViewController) {
        self.holdingViewController = parentVC;
        [self addCard:vc];
    }
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [self randomColor];
}

- (void)prepareForReuse {
    [super prepareForReuse];
//    [self removeCard];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [self randomColor];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    self.containedViewController.view.frame = layoutAttributes.bounds;
}

- (void)addCard:(UIViewController *)vc {
    [self.holdingViewController addChildViewController:vc];
    vc.view.frame = self.bounds;
    [self addSubview:vc.view];
    [vc didMoveToParentViewController:self.holdingViewController];
    self.containedViewController = vc;
}

//- (void)removeCard {
//    [self.containedViewController willMoveToParentViewController:nil];
//    [self.containedViewController.view removeFromSuperview];
//    [self.containedViewController removeFromParentViewController];
//}

@end
