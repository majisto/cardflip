//
//  ViewController_Expanded.m
//  CardFlip
//
//  Created by Daniel Durbin on 2/9/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ViewController_Expanded.h"

@interface ViewController_Expanded ()

@end

@implementation ViewController_Expanded

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *) cardImage:(PlayingCard *) card{
    return [UIImage imageNamed:card.ischosen ? @"white_image" : @"bulba"];
}

@end
