//
//  ViewController.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) MatchingGame *game;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *) cardImage:(PlayingCard *) card{
    return [UIImage imageNamed:card.ischosen ? @"white_image" : @"charie"];
}

-(MatchingGame *) game{
    if (!_game) {_game = [[MatchingGame alloc] initWithArray:@[@"30",@"1"]];}
    return _game;
}

@end

