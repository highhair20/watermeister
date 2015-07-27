//
//  SprinklerStation.m
//  WaterMeister
//
//  Created by Jason Kelly on 5/9/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import "SprinklerStation.h"

@implementation SprinklerStation

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

@end
