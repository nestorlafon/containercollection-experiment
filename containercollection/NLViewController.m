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

#define S_TOP 8
#define S_BOTTOM S_TOP
#define S_LEFT 8
#define S_RIGHT S_LEFT
#define L_SEP S_TOP/2
#define I_SEP S_LEFT/2

@interface NLViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *viewControllers;
@end

@implementation NLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[[NLCardViewController cardViewControllerWithString:@"ein" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"zwei" widthFactor:0.5],
                             [NLCardViewController cardViewControllerWithString:@"drei" widthFactor:0.5],
                             [NLCardViewController cardViewControllerWithString:@"vier" widthFactor:0.5],
                             [NLCardViewController cardViewControllerWithString:@"fünf" widthFactor:0.5],
                             [NLCardViewController cardViewControllerWithString:@"sechs" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"sieben" widthFactor:0.5],
                             [NLCardViewController cardViewControllerWithString:@"acht" widthFactor:0.5],
                             [NLCardViewController cardViewControllerWithString:@"neun" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"zehn" widthFactor:0.5],
                             [NLCardViewController cardViewControllerWithString:@"elf" widthFactor:1],
                             [NLCardViewController cardViewControllerWithString:@"zwölf" widthFactor:0.75],
                             [NLCardViewController cardViewControllerWithString:@"dreizehn" widthFactor:0.25],
                             [NLCardViewController cardViewControllerWithString:@"vierzehn" widthFactor:0.3],
                             [NLCardViewController cardViewControllerWithString:@"fünfzehn" widthFactor:0.3],
                             [NLCardViewController cardViewControllerWithString:@"sechszehn" widthFactor:0.4]
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
    return CGSizeMake(collectionView.frame.size.width*factor - separator, round(collectionView.frame.size.height/3 - 10));
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





@end
