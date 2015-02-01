//
//  ViewController.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "MatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totalScore;
@property (weak, nonatomic) IBOutlet UILabel *previousScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *games_playedLabel; //cardsDeckLabel
@property (weak, nonatomic) IBOutlet UILabel *averageScoreLabel;
@property (strong, nonatomic) Deck *myDeck;@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonArray;
@property (strong, nonatomic) MatchingGame *game;
@end

@implementation ViewController

- (IBAction)peekClick:(UIButton *)sender {
    if (!self.peeked){
        int i = 0;
        for (UIButton* b in self.buttonArray){
            [b setBackgroundImage:[UIImage imageNamed:@"white_image"] forState:UIControlStateNormal];
            Card * card = [self.game cardAtIndex:i];
            [b setTitle:card.contents forState:UIControlStateNormal];
//            [b setTitle:@(i).stringValue forState:UIControlStateNormal];
            i++;
        }
        self.peeked = true;
    }
    else{
        for (UIButton* b in self.buttonArray){
            [b setBackgroundImage:[UIImage imageNamed:@"pokedoge"] forState:UIControlStateNormal];
            [b setTitle:@"" forState:UIControlStateNormal];
        }
        self.peeked = false;
    }
}

- (IBAction)resetClick:(UIButton *)sender {
    NSLog(@"Reset Button clicked!");
    [self flipCardsOver];
}

-(void) flipCardsOver{
    for (UIButton* b in self.buttonArray){
        [b setBackgroundImage:[UIImage imageNamed:@"pokedoge"] forState:UIControlStateNormal];
        [b setTitle:@"" forState:UIControlStateNormal];
    }
}

-(Deck *) myDeck{
    if (!_myDeck) {_myDeck = [[PlayingCardDeck alloc] init];}
    return _myDeck;
}

-(MatchingGame *) game{
    if (!_game) {_game = [[MatchingGame alloc] init:30];}
    return _game;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.face_up_down = false;
    self.peeked = false;
//    [self.game printCards];
}

- (void) updateUI{
    self.totalScore.text = [NSString stringWithFormat:@"Total Score: %d",self.game.total_score];
    self.previousScoreLabel.text = [NSString stringWithFormat:@"Previous Score: %d",self.game.previous_score];
    for (UIButton * button in self.buttonArray){
        NSUInteger index = [self.buttonArray indexOfObject:button];
        PlayingCard *card = [self.game cardAtIndex:index];
        [button setTitle:[self cardTitle:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self cardImage:card] forState:UIControlStateNormal];
        button.enabled = !card.matched;
    }
}

- (NSString *) cardTitle:(PlayingCard *) card{
    return card.ischosen ? [card contents] : @"";
}

- (UIImage *) cardImage:(PlayingCard *) card{
    return [UIImage imageNamed:card.ischosen ? @"white_image" : @"pokedoge"];
}

- (IBAction)card_click:(id)sender {
    NSUInteger index = [self.buttonArray indexOfObject:sender];
//    NSLog(@"Index from sender is: %lu",(unsigned long)index);
    Card * a = [self.game cardAtIndex:index];
//    NSLog(@"Card at button index %lu is: %@",index, a.contents);
    [self.game resolveClick:index];
    [self updateUI];
}

@end
