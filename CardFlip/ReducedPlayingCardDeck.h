//
//  ReducedPlayingCardDeck.h
//  CardFlip
//
//  Created by Daniel Durbin on 2/10/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "Deck.h"
#import "ReducedPlayingCard.h"

@interface ReducedPlayingCardDeck : Deck
-(ReducedPlayingCard *) drawRandCard;
@end
