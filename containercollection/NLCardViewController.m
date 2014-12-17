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

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@-%@", self.theString, NSStringFromSelector(_cmd));
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@-%@", self.theString, NSStringFromSelector(_cmd));
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%@-%@", self.theString, NSStringFromSelector(_cmd));
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%@-%@", self.theString, NSStringFromSelector(_cmd));
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    NSLog(@"%@-%@", self.theString, NSStringFromSelector(_cmd));
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.theLabel.text = self.theString;
    self.innerView.backgroundColor = [UIColor whiteColor];
    self.innerView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.innerView.layer.shadowOpacity = 0.17f;
    self.innerView.layer.shadowOffset = CGSizeMake(1.0, 1.5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissAction:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
