//
//  ReducedPlayingCard.h
//  CardFlip
//
//  Created by Daniel Durbin on 2/10/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import "RSCard.h"

@interface ReducedPlayingCard : RSCard
@property (nonatomic) NSUInteger rank;
@property(strong, nonatomic) NSString* suit;

+ (NSArray *) validSuits;

@end
