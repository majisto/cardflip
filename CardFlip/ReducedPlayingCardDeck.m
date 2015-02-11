//
//  ReducedPlayingCardDeck.m
//  CardFlip
//
//  Created by Daniel Durbin on 2/10/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ReducedPlayingCardDeck.h"

@interface ReducedPlayingCardDeck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation ReducedPlayingCardDeck

- (instancetype) init{
    self = [super init];
    
    if (self)
    {
        NSLog(@"Valid suits in ReducedPlayingCard: %@", [ReducedPlayingCard validSuits]);
        for (NSString *suit in [ReducedPlayingCard validSuits]){
            NSLog(@"Suit is: %@",suit);
            for (NSInteger rank = 1; rank <= [ReducedPlayingCard max_rank]; rank++){
                ReducedPlayingCard *card = [[ReducedPlayingCard alloc] init];
                ReducedPlayingCard *card2 = [[ReducedPlayingCard alloc] init];
                ReducedPlayingCard *card3 = [[ReducedPlayingCard alloc] init];
                ReducedPlayingCard *card4 = [[ReducedPlayingCard alloc] init];
                card.rank = rank; card2.rank = rank; card3.rank = rank; card4.rank = rank;
                card.suit = suit; card2.suit = suit; card3.suit = suit; card4.suit = suit;
                [self addCard:card]; [self addCard:card2]; [self addCard:card3]; [self addCard:card4];
            }
        }
    }
    
    return self;
}

-(ReducedPlayingCard *) drawRandCard
{
    ReducedPlayingCard * randCard = nil;
    
    if ([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randCard;
}

@end
