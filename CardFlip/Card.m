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
    return [self.contents isEqualToString:[cards firstObject]] ? 1:0;
}

@end


