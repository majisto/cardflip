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
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *shuffleLabel;
@property (weak, nonatomic) IBOutlet UILabel *games_playedLabel; //cardsDeckLabel
@property (nonatomic) int flipCount;
@property (nonatomic) int numShuffles;
@property (strong, nonatomic) Deck *myDeck;
@property (nonatomic) NSUInteger games_played;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonArray;

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
    self.games_played++;
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

- (void)setGames_played:(NSUInteger)games_played{
    _games_played = games_played;
    self.games_playedLabel.text = [NSString stringWithFormat:@"Games Played: %lu", (unsigned long)self.games_played];
}

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (void)setNumShuffles:(int)numShuffles{
    _numShuffles = numShuffles;
    self.shuffleLabel.text = [NSString stringWithFormat:@"No. of Re-Shuffles: %d", self.numShuffles];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.face_up_down = false;
    self.peeked = false;
    [self.game printCards];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)card_click:(id)sender {
    NSUInteger index = [self.buttonArray indexOfObject:sender];
    NSLog(@"Index from sender is: %lu",(unsigned long)index);
    Card * a = [self.game cardAtIndex:index];
    NSLog(@"Card at button index %lu is: %@",index, a.contents);
    
//    if (self.face_up_down) //True is face up
//    {
//        [sender setBackgroundImage:[UIImage imageNamed:@"pokedoge"] forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    }
//    else
//    {
//        PlayingCard * randCard = [self.myDeck drawRandCard];
//        if (!randCard) { //If no cards in deck, re-shuffle by re-creating the myDeck object.
//            _myDeck = [[PlayingCardDeck alloc] init];
//            self.flipCount = 0;
//            randCard = [self.myDeck drawRandCard];
//            self.numShuffles++;
//        }
//        [sender setBackgroundImage:[UIImage imageNamed:@"white_image"] forState:UIControlStateNormal];
//        [sender setTitle:randCard.contents forState:UIControlStateNormal];
//        self.flipCount++;
//    }
//    self.face_up_down = !self.face_up_down;
}

@end
