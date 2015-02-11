//
//  ViewController_Abstract.m
//  CardFlip
//
//  Created by Daniel Durbin on 2/9/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ViewController_Abstract.h"
#import "PlayingCard.h"
#import "MatchingGame.h"

@interface ViewController_Abstract ()
@property (weak, nonatomic) IBOutlet UILabel *totalScore;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonArray;
@property (strong, nonatomic) MatchingGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@end

@implementation ViewController_Abstract

- (IBAction)peekClick:(UIButton *)sender {
    [self.game peek];
    [self updateUI];
}

- (IBAction)changeModeSegmented:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0){
        [self.game setThree_card:false];
    }
    else if (sender.selectedSegmentIndex == 1){
        [self.game setThree_card:true];
    }
}

- (IBAction)resetClick:(UIButton *)sender {
    [self.game resetGame];
    [self updateUI];
}

-(MatchingGame *) game{
    if (!_game) {_game = [[MatchingGame alloc] initWithArray:@[@"30",@"1"]];}
    return _game;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/* Updates all UI buttons.  Also updates the two main scores. Has two helper methods that run
 off the chosen property of a card.  Chosen is really important! */
- (void) updateUI{
    self.totalScore.text = [NSString stringWithFormat:@"Total Score: %d",self.game.total_score];
    
    for (UIButton * button in self.buttonArray){
        NSUInteger index = [self.buttonArray indexOfObject:button];
        PlayingCard *card = [self.game cardAtIndex:index];
        [button setTitle:[self cardTitle:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self cardImage:card] forState:UIControlStateNormal];
        button.enabled = !card.matched;
    }}

- (NSString *) cardTitle:(PlayingCard *) card{
    return card.ischosen ? [card contents] : @"";
}

- (UIImage *) cardImage:(PlayingCard *) card{
    return [UIImage imageNamed:card.ischosen ? @"white_image" : @"pokedoge"];
}

/* Main click event for card buttons.  Checks to make sure peek isn't enabled, so no
 action should be taken.  Otherwise, gets the button index and sends it to the game model.*/
- (IBAction)card_click:(id)sender {
    if (self.game.peeked) return;
    NSUInteger index = [self.buttonArray indexOfObject:sender];
    [self.game resolveClick:index];
    [self updateUI];
}

@end
