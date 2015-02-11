//
//  RSCard.m
//  CardFlip
//
//  Created by Daniel Durbin on 2/10/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "RSCard.h"

@implementation RSCard

- (NSArray *)validSuits{
    return nil;
}

- (NSDictionary *)suitColors{
    return nil;
}

+ (NSArray *) validRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) max_rank {
    return [[self validRanks] count] - 1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [RSCard max_rank])
        _rank = rank;
}

@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    return nil;
}

- (void)setSuit:(NSString *)suit
{
    if ([[RSCard validSuits] containsObject:suit])
        _suit=suit;
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

@end
