//
//  RSCard.h
//  CardFlip
//
//  Created by Daniel Durbin on 2/10/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "Card.h"

@interface RSCard : Card

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString* suit;
- (NSArray *) validSuits;
- (NSDictionary *) suitColors;

+ (NSArray *) validRanks;
+ (NSUInteger) max_rank;
+ (NSArray *) validSuits;

@end
