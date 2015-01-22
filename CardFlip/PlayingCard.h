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
@property (nonatomic) int rank;
@property (strong, nonatomic) NSMutableString* suit;
@end
