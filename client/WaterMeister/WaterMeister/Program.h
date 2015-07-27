//
//  Program.h
//  WaterMeister
//
//  Created by Jason Kelly on 5/20/15.
//  Copyright (c) 2015 Jason Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Program : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *zones;
@end

@interface Program (CoreDataGeneratedAccessors)

- (void)addZonesObject:(NSManagedObject *)value;
- (void)removeZonesObject:(NSManagedObject *)value;
- (void)addZones:(NSSet *)values;
- (void)removeZones:(NSSet *)values;

@end
