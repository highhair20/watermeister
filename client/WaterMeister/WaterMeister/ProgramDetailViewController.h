//
//  ProgramDetailViewViewController.h
//  WaterMeister
//
//  Created by Jason Kelly on 5/16/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SprinklerProgram.h"

@interface ProgramDetailViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) SprinklerProgram *currentProgram;


@end
