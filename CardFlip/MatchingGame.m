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
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (strong, nonatomic) Deck *myDeck;
@end

@implementation MatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
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

- (Card *)cardAtIndex:(NSUInteger) index{
    return [self.cards objectAtIndex:index];
}

@end
