//
//  Deck.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/23/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "Deck.h"
#import "PlayingCard.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; //Array of cards in deck
@end

@implementation Deck

-(NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void) addCard:(Card*) card atTop:(bool) atTop
{
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}

-(NSUInteger) numCards
{
    return [self.cards count];
}

-(PlayingCard *) drawRandCard
{
    PlayingCard * randCard = nil;
    
    if ([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randCard;
}

-(void) addCard:(Card*) card
{
    [self addCard:card atTop:false];
}

@end
