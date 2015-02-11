//
//  ExpandedPlayingCardDeck.h
//  CardFlip
//
//  Created by Daniel Durbin on 2/11/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "Deck.h"
#import "ExpandedPlayingCard.h"

@interface ExpandedPlayingCardDeck : Deck
-(ExpandedPlayingCard *) drawRandCard;
@end
