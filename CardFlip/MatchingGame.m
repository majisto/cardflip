//
//  MatchingGame.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/29/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "MatchingGame.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "ReducedPlayingCardDeck.h"
#import "ReducedPlayingCard.h"

@interface MatchingGame ()
@property (nonatomic, readwrite) int total_score;
@property (nonatomic, readwrite) double_t average_score;
@property (nonatomic, readwrite) int games_played;
@property (nonatomic, readwrite) int previous_score;

@property (nonatomic, strong) NSMutableArray *cards;
@property (strong, nonatomic) PlayingCardDeck *myDeck;
@property (strong, nonatomic) ReducedPlayingCardDeck *myRedDeck;
@property (strong, nonatomic) ExpandedPlayingCardDeck *myExpDeck;

@property (nonatomic, readwrite) BOOL three_card;

@property (nonatomic, strong) NSMutableArray *chosen_cards;
@property (nonatomic, strong) NSMutableArray *game_scores;
@property (nonatomic) int type_of_game; //0 = reduced, 1 = regular, 2 = expanded.

@property (nonatomic, readwrite) BOOL peeked;
@end

@implementation MatchingGame

- (void) peek{
    self.peeked = !self.peeked;
    if (self.peeked){
        self.total_score -= 15;
        for (PlayingCard *card in self.cards){
            if (!card.matched) card.chosen = true;
        }
    }
    else{
        for (PlayingCard *card in self.cards)
            if (!card.matched && ![self.chosen_cards containsObject:card]) card.chosen = false;
    }
}

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSMutableArray *) chosen_cards
{
    if (!_chosen_cards) _chosen_cards = [[NSMutableArray alloc] init];
    return _chosen_cards;
}

- (NSMutableArray *) game_scores
{
    if (!_game_scores) _game_scores = [[NSMutableArray alloc] init];
    return _game_scores;
}

- (void) setThree_card:(BOOL)three_card{
    _three_card = three_card;
}

- (void) setPeeked:(BOOL)peeked{
    _peeked = peeked;
}

- (void) changeMode{
    for (PlayingCard *card in self.chosen_cards){
        card.chosen = false;
    }
    [self.chosen_cards removeAllObjects];
}

- (instancetype) initWithArray:(NSArray *)count{
    self = [super init];
    
    if (self){
        int cardnum = [count[0] intValue];
        self.type_of_game = [count[1] intValue];
        if (self.type_of_game == 0){
            _myRedDeck = [[ReducedPlayingCardDeck alloc] init];
            for (int i = 0; i < cardnum; ++i){
                ReducedPlayingCard * c = [self.myRedDeck drawRandCard];
                if (c)
                    [self.cards addObject:c];
                else{
                    self = nil;
                    break;
                }
            }
        }
        else if (self.type_of_game == 1){
            _myDeck = [[PlayingCardDeck alloc] init];
            for (int i = 0; i < cardnum; ++i){
                PlayingCard * c = [self.myDeck drawRandCard];
                if (c)
                    [self.cards addObject:c];
                else{
                    self = nil;
                    break;
                }
            }
        }
        else{
            _myExpDeck = [[ExpandedPlayingCardDeck alloc] init];
            for (int i = 0; i < cardnum; ++i){
                ExpandedPlayingCard * c = [self.myExpDeck drawRandCard];
                if (c)
                    [self.cards addObject:c];
                else{
                    self = nil;
                    break;
                }
            }
        }
    }
    _peeked = false;
    return self;
}

- (void) resetDeck{
    _cards = [[NSMutableArray alloc] init];
    _chosen_cards = [[NSMutableArray alloc] init];
    switch (self.type_of_game) {
        case 0:
            _myRedDeck = [[ReducedPlayingCardDeck alloc]init];
            for (int i = 0; i < 30; ++i){
                ReducedPlayingCard * c = [self.myRedDeck drawRandCard];
                [self.cards addObject:c];
            }
            break;
        case 1:
            _myDeck = [[PlayingCardDeck alloc] init];
            for (int i = 0; i < 30; ++i){
                PlayingCard * c = [self.myDeck drawRandCard];
                [self.cards addObject:c];
            }
        case 2:
            _myExpDeck = [[ExpandedPlayingCardDeck alloc] init];
            for (int i = 0; i < 30; ++i){
                ExpandedPlayingCard* c = [self.myExpDeck drawRandCard];
                [self.cards addObject:c];
            }
        default:
            break;
    }
}

/* Resetting involves making a new deck, and a new set of 30 cards in the card array.  We
 also calculate the new average score. */
- (void) resetGame{
    self.peeked = false;
    self.games_played ++;
    double_t gp = self.games_played;
    self.average_score = (((gp - 1) / gp) * self.average_score) + ((1/gp) * self.total_score);
    self.previous_score = 0;
    self.total_score = 0;
    [self resetDeck];
//    _myDeck = [[PlayingCardDeck alloc] init];
//    _myRedDeck = [[ReducedPlayingCardDeck alloc]init];
//    _cards = [[NSMutableArray alloc] init];
//    _chosen_cards = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 30; ++i){
//        ReducedPlayingCard * c = [self.myRedDeck drawRandCard];
//        [self.cards addObject:c];
//        }
}

/* Main logic in Game.  This receives an index of the button clicked, which corresponds to the
 index in the card array.  We will add the card to chosen_cards, check if it already exists,
 deduct points and then call match if we have 2 or 3 cards. Scores are also updated. */
- (void) resolveClick:(NSUInteger) index{
    PlayingCard *card = [self cardAtIndex:index];
    if ([self checkForSameCard:card]) return;
    [self.chosen_cards addObject:card];
    card.chosen = true;
    self.total_score -= 1;
    
    if ([self.chosen_cards count] == 2 && !self.three_card){
        int new_score = [PlayingCard match:_chosen_cards];
        for (PlayingCard * c in _chosen_cards){
            c.matched = true;
        }
        [self.chosen_cards removeAllObjects];
        self.previous_score = new_score;
        self.total_score += new_score;
    }
    
    else if ([self.chosen_cards count] == 3){ //Three cards to match
        int new_score = [PlayingCard match:_chosen_cards];
        for (PlayingCard * c in _chosen_cards){
            c.matched = true;
        }
        [self.chosen_cards removeAllObjects];
        self.previous_score = new_score;
        self.total_score += new_score;
    }
}

/* Checks to see if card is chosen card is already in chosen_cards array.
 If it is, we need to take it out and penalize player. */
- (BOOL) checkForSameCard:(PlayingCard *) card{
    if ([self.chosen_cards containsObject:card]) {
        card.chosen = false;
        [self.chosen_cards removeObject:card];
        return true;
    }
    return false;
}

- (PlayingCard *)cardAtIndex:(NSUInteger) index{
    return [self.cards objectAtIndex:index];
}

/* Prints all cards in local cards array */
- (void)printCards{
    int i = 0;
    for (PlayingCard *card in _cards){
        NSLog(@"Card %d: %@",i,card.contents); ++i;
    }
}

@end
