//
//  ReducedPlayingCard.m
//  CardFlip
//
//  Created by Daniel Durbin on 2/10/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "ReducedPlayingCard.h"

@implementation ReducedPlayingCard

+ (NSArray *) validSuits
{
    return @[@"♠"];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
    if ([[ReducedPlayingCard validSuits] containsObject:suit])
        _suit=suit;
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [RSCard max_rank])
        _rank = rank;
}

- (NSString *)contents{
    return [[ReducedPlayingCard validRanks][self.rank] stringByAppendingString:self.suit];
}

@end
