//
//  ViewController_Expanded.m
//  CardFlip
//
//  Created by Daniel Durbin on 2/9/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ViewController_Expanded.h"

@interface ViewController_Expanded ()
@property (strong, nonatomic) MatchingGame *game;
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

-(MatchingGame *) game{
    if (!_game) {_game = [[MatchingGame alloc] initWithArray:@[@"30",@"1"]];}
    return _game;
}

@end
