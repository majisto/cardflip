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

- (int) match:(NSArray *) cards
{
    int score = 0;
    
    for (Card* c in cards){
        if ([c.contents isEqualToString:self.contents])
            score = 1;
    }
    return score;
}

@end


