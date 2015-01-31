//
//  PlayingCard.h
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString* suit;
- (int) match:(NSArray *) cards;

+ (NSArray *) validSuits;
+ (NSUInteger) max_rank;

@end
