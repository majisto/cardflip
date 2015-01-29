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

- (int) match:(Card *) card
{
    if ([self.contents isEqualToString:card.contents])
        return 1;
    else
        return 0;
}

@end


