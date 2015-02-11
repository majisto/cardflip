//
//  RSCard.h
//  CardFlip
//
//  Created by Daniel Durbin on 2/10/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "Card.h"

@interface RSCard : Card

- (NSArray *) validSuits; //Required
- (NSDictionary *) suitColors; //Required
+ (NSArray *) validRanks;
+ (NSUInteger) max_rank;

@end
