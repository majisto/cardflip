//
//  Deck.h
//  CardFlip
//
//  Created by Daniel Durbin on 1/23/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "PlayingCard.h"

@interface Deck : NSObject
-(void) addCard:(Card*) card atTop:(bool) atTop;
-(void) addCard:(Card*) card;
-(PlayingCard *) drawRandCard;
-(NSUInteger) numCards;

@end
