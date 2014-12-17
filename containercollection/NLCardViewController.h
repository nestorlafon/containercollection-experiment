//
//  CardViewController.h
//  containercollection
//
//  Created by Nestor Lafon-Gracia on 16/12/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLCardViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *theLabel;
@property (weak, nonatomic) IBOutlet UIView *innerView;
@property (assign, nonatomic) CGFloat widthFactor;

+ (instancetype)cardViewControllerWithString:(NSString *)string widthFactor:(CGFloat)wFactor;
@end
