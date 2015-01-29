//
//  MatchingGame.h
//  CardFlip
//
//  Created by Daniel Durbin on 1/29/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface MatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
- (Card *)cardAtIndex:(NSUInteger) index;
- (instancetype) init:(NSUInteger)count;
@end
