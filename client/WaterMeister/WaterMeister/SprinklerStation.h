//
//  SprinklerStation.h
//  WaterMeister
//
//  Created by Jason Kelly on 5/9/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SprinklerStation : NSObject

@property (nonatomic) NSString *name;
// status is running, scheduled or off
@property (nonatomic) NSString *status;
@property (nonatomic) UIColor *statusTextColor;

@end
