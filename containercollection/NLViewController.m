//
//  ViewController.m
//  containercollection
//
//  Created by Nestor Lafon-Gracia on 16/12/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import "NLViewController.h"
#import "NLCollectionViewCell.h"
#import "NLCardViewController.h"

#define S_TOP 4
#define S_BOTTOM S_TOP
#define S_LEFT 5
#define S_RIGHT S_LEFT
#define L_SEP 4
#define I_SEP L_SEP

@interface NLViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *viewControllers;
@end

@implementation NLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[[NLCardViewController cardViewControllerWithString:@"ein" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"zwei" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"drei" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"vier" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"fünf" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"sechs" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"sieben" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"acht" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"neun" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"zehn" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"elf" widthFactor:4],
                             [NLCardViewController cardViewControllerWithString:@"zwölf" widthFactor:1.0f/0.75f],
                             [NLCardViewController cardViewControllerWithString:@"dreizehn" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"vierzehn" widthFactor:2],
                             [NLCardViewController cardViewControllerWithString:@"fünfzehn" widthFactor:1]
                             ];
    [self.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.collectionView registerClass:[NLCollectionViewCell class] forCellWithReuseIdentifier:[NSStringFromClass([obj class]) stringByAppendingFormat:@"%lu", (unsigned long)idx]];
    }];
}

//--

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.viewControllers count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSStringFromClass([self.viewControllers[indexPath.row] class]) stringByAppendingFormat:@"%ld", (long)indexPath.row]
                                                                           forIndexPath:indexPath];
    [cell setupWithViewController:self.viewControllers[indexPath.row] andParent:self];
    return cell;
}

//--

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat factor = [self.viewControllers[indexPath.row] widthFactor];
    CGFloat separator = 0;
    if (factor == 1) {
        separator = S_RIGHT + S_LEFT;
    }
    else {
        separator= S_RIGHT + I_SEP/2; //Assuming max of 2 per row
    }
    CGFloat w = collectionView.frame.size.width*(1.0f/factor) - separator;
    CGFloat h = 146;//collectionView.frame.size.width/2 - (S_RIGHT + I_SEP/2);
    return CGSizeMake(w, h);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(S_TOP, S_LEFT, S_BOTTOM, S_RIGHT);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return L_SEP;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return I_SEP;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self presentViewController:[NLCardViewController cardViewControllerWithString:@"modal" widthFactor:1] animated:YES completion:nil];
}




@end
