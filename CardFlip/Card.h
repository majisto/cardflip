//
//  Card.h
//  CardFlip
//
//  Created by Daniel Durbin on 1/22/15.
//  Copyright (c) 2015 Daniel Durbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSMutableString* contents;
- (int) match:(Card *) card;

@property (nonatomic, getter=ischosen) BOOL chosen;
@property (nonatomic, getter=ismatched) BOOL matched;

@end
