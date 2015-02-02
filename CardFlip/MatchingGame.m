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

@interface MatchingGame ()
@property (nonatomic, readwrite) int total_score;
@property (nonatomic, readwrite) double_t average_score;
@property (nonatomic, readwrite) int games_played;
@property (nonatomic, readwrite) int previous_score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (strong, nonatomic) PlayingCardDeck *myDeck;
@property (nonatomic, readwrite) BOOL three_card;
@property (nonatomic, strong) NSMutableArray *chosen_cards;
@end

@implementation MatchingGame

- (void) peek{
    self.total_score -= 15;
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

- (void) setThree_card:(BOOL)three_card{
    _three_card = three_card;
}

- (instancetype) init:(NSUInteger)count{
    self = [super init];
    
    if (self){
        _myDeck = [[PlayingCardDeck alloc] init];
        for (int i = 0; i < count; ++i){
            PlayingCard * c = [self.myDeck drawRandCard];
            if (c)
                [self.cards addObject:c];
            else{
                self = nil;
                break;
            }
        }
    }

    return self;
}

- (void) resetGame{
    self.games_played ++;
    self.average_score = (self.average_score + self.total_score) / self.games_played;
    self.previous_score = 0;
    self.total_score = 0;
    _myDeck = [[PlayingCardDeck alloc] init];
    _cards = [[NSMutableArray alloc] init];
    _chosen_cards = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; ++i){
        PlayingCard * c = [self.myDeck drawRandCard];
        [self.cards addObject:c];
        }
}

- (void) resolveClick:(NSUInteger) index{
    NSLog(@"Three card value: %d", self.three_card);
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

- (BOOL) checkForSameCard:(PlayingCard *) card{
    if ([self.chosen_cards containsObject:card]) {
        //Card already chosen, flip back over.
        card.chosen = false;
        self.previous_score = 0;
        [self.chosen_cards removeObject:card];
        return true;
    }
    return false;
}

- (PlayingCard *)cardAtIndex:(NSUInteger) index{
    return [self.cards objectAtIndex:index];
}

- (void)printCards{
    int i = 0;
    for (PlayingCard *card in _cards){
        NSLog(@"Card %d: %@",i,card.contents); ++i;
    }
}

@end
