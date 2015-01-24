//
//  Deck.h
//  CardFlip
//
//  Created by Daniel Durbin on 1/23/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(Card *) drawRandCard;

@end
