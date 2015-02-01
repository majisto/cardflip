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
@property (nonatomic, readwrite) NSInteger games_played;
@property (nonatomic, readwrite) int previous_score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, readwrite) BOOL three_card;
@property (strong, nonatomic) PlayingCardDeck *myDeck;
@property (nonatomic, strong) NSMutableArray *chosen_cards;
@end

@implementation MatchingGame

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

- (void) resolveClick:(NSUInteger) index{
    PlayingCard *card = [self cardAtIndex:index];
    if ([self checkForSameCard:card]) return;
//    NSLog(@"Resolve Click's Playing Card is: %@",card.contents);
    [self.chosen_cards addObject:card];
    card.chosen = true;
//    NSLog(@"Size of chosen_cards array: %lu",(unsigned long)[self.chosen_cards count]);
    if ([self.chosen_cards count] == 1)
        self.total_score -= 1;
    else if ([self.chosen_cards count] == 2){
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
        //Card already chosen, flip back over and add lost point back.
        card.chosen = false;
        self.total_score += 1;
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
