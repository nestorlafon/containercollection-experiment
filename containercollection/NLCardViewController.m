//
//  CardViewController.m
//  containercollection
//
//  Created by Nestor Lafon-Gracia on 16/12/14.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

#import "NLCardViewController.h"

@interface NLCardViewController ()
@property (strong, nonatomic) NSString *theString;
@end

@implementation NLCardViewController

+ (instancetype)cardViewControllerWithString:(NSString *)string widthFactor:(CGFloat)wFactor {
    NLCardViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"cardViewController"];
    vc.theString = string;
    vc.widthFactor = wFactor;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.theLabel.text = self.theString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
