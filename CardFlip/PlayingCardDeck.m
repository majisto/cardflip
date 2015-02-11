//
//  PlayingCardDeck.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/24/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        for (NSString *suit in [PlayingCard validSuits]){
            for (NSInteger rank = 1; rank <= [PlayingCard max_rank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}


@end
