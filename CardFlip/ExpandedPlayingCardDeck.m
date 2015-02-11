//
//  ExpandedPlayingCardDeck.m
//  CardFlip
//
//  Created by Daniel Durbin on 2/11/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ExpandedPlayingCardDeck.h"

@interface ExpandedPlayingCardDeck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation ExpandedPlayingCardDeck



-(ExpandedPlayingCard *) drawRandCard
{
    ExpandedPlayingCard * randCard = nil;
    
    if ([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randCard;
}

@end
