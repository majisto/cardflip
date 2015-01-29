//
//  PlayingCard.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "PlayingCard.h"
#import "Card.h"

@implementation PlayingCard

- (int) match:(Card *) card
{
    return 0; //Change this.
}

+ (NSArray *) validRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) max_rank {return [[self validRanks] count] - 1;}

- (NSString *) contents
{
    return [[PlayingCard validRanks][self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; //_suit is the instance variable.

+ (NSArray *) validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
        _suit=suit;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard max_rank])
        _rank = rank;
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}
@end

