//
//  StatusViewController.h
//  WaterMeister
//
//  Created by Jason Kelly on 5/9/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SprinklerProgram.h"
#import "SprinklerStation.h"

@interface StatusViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

- (void)addButtonPressed:(UIButton *)sender;


@end
