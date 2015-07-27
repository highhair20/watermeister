//
//  SprinklerProgram.m
//  WaterMeister
//
//  Created by Jason Kelly on 5/10/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import "SprinklerProgram.h"

@implementation SprinklerProgram

-(UIColor *) statusTextColor
{
    UIColor *color;
    if ([self.status isEqualToString:@"Running"]) {
        color = [UIColor greenColor];
    } else if ([self.status isEqualToString:@"Off"]) {
        color = [UIColor redColor];
    } else {
        color = [UIColor lightGrayColor];
    }
    return color;
}

- (id)initWithDefaults {
    self = [self init];
    self.name = @"";
    return self;
}

- (void)addStation:(SprinklerStation *)station
{
    [self.stations addObject:station];
    return;
}

@end
