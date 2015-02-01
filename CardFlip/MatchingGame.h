//
//  MatchingGame.h
//  CardFlip
//
//  Created by Daniel Durbin on 1/29/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "PlayingCard.h"

@interface MatchingGame : NSObject

@property (nonatomic, readonly) int total_score;
@property (nonatomic, readonly) double_t average_score;
@property (nonatomic, readonly) NSInteger games_played;
@property (nonatomic, readonly) NSInteger previous_score;
@property (nonatomic, readonly) BOOL three_card; //True means three_card.
- (PlayingCard *)cardAtIndex:(NSUInteger) index;
- (instancetype) init:(NSUInteger)count;
- (void) printCards; //Prints all cards in game to NSLog.
- (void) resolveClick:(NSUInteger) index;
@end
