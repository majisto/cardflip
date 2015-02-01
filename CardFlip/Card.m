//
//  Card.m
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "Card.h"

@interface Card() //Private declaration

@end

@implementation Card

+ (int) match:(NSArray *) cards
{
    if ([cards count] == 2)
        return [[[cards firstObject] contents] isEqualToString:[[cards objectAtIndex:1] contents]] ? 1:0;
    else if ([cards count] == 3){
        Card * card1 = [cards objectAtIndex:0];
        Card * card2 = [cards objectAtIndex:1];
        Card * card3 = [cards objectAtIndex:2];
        return [[card1 contents] isEqualToString:[card2 contents]] &&
            [[card2 contents] isEqualToString:[card3 contents]] &&
            [[card1 contents] isEqualToString:[card3 contents]] ? 1:0;
    }
    return 0;
}

@end


