//
//  PlayingCard.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "PlayingCard.h"


@implementation PlayingCard

+ (int) match:(NSArray *) cards
{
    int score = 0;
    if ([cards count] == 2){
        PlayingCard *c1= [cards firstObject];
        PlayingCard *c2= [cards objectAtIndex:1];
        int c1Color = [PlayingCard getColorofSuit:c1];
        int c2color = [PlayingCard getColorofSuit:c2];
        if (c1.rank == c2.rank){
            if (c1Color == c2color) score += 16;
            else score += 8;
        }
        else if ([c1.suit isEqualToString:c2.suit]) score += 2;
        else if (c1Color == c2color) score += 1;
    }
    else if ([cards count] == 3){
        
    }
    
    return score;
}

+ (int) getColorofSuit:(PlayingCard*) card{ //True is red
    return [card.suit isEqualToString:@"♥"] || [card.suit isEqualToString:@"♦"] ? 1 : 0;
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

