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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *shuffleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardsDeckLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) NSUInteger cardsInDeck;
@property (nonatomic) int numShuffles;
@property (strong, nonatomic) Deck *myDeck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonArray;
@end

@implementation ViewController

-(Deck *) myDeck{
    if (!_myDeck) {_myDeck = [[PlayingCardDeck alloc] init];}
    return _myDeck;
}

- (void)setCardsInDeck:(NSUInteger)cardsInDeck{
    _cardsInDeck = cardsInDeck;
    self.cardsDeckLabel.text = [NSString stringWithFormat:@"Cards in deck: %lu", (unsigned long)self.cardsInDeck];
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)card_click:(id)sender {
    if (self.face_up_down) //True is face up
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"pokedoge"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else
    {
        PlayingCard * randCard = [self.myDeck drawRandCard];
        if (!randCard) { //If no cards in deck, re-shuffle by re-creating the myDeck object.
            _myDeck = [[PlayingCardDeck alloc] init];
            self.flipCount = 0;
            self.cardsInDeck = 52;
            randCard = [self.myDeck drawRandCard];
            self.numShuffles++;
        }
        [sender setBackgroundImage:[UIImage imageNamed:@"white_image"] forState:UIControlStateNormal];
        [sender setTitle:randCard.contents forState:UIControlStateNormal];
        self.cardsInDeck = _myDeck.numCards;
        self.flipCount++;
    }
    self.face_up_down = !self.face_up_down;
}

@end
