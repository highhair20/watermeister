//
//  SprinklerProgram.h
//  WaterMeister
//
//  Created by Jason Kelly on 5/10/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SprinklerStation.h"

@interface SprinklerProgram : NSObject

@property (nonatomic) NSString *name;
// status is running, scheduled or off
@property (nonatomic) NSString *status;
@property (nonatomic) UIColor *statusTextColor;
@property (nonatomic) NSMutableArray *stations;

- (id)initWithDefaults;
- (void)addStation:(SprinklerStation *)station;


@end
