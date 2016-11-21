//
//  HealthKitManager.m
//  AmadeusFit2
//
//  Created by kumar on 21/11/16.
//  Copyright © 2016 kumar. All rights reserved.
// This is a singleton for all required instances in any viewcontroller.

#import "HealthKitManager.h"
#import <HealthKit/HealthKit.h>

@interface HealthKitManager()

@property(nonatomic,strong)HKHealthStore *healthStore;
@end

@implementation HealthKitManager

+(HealthKitManager*)sharedManager{
    static dispatch_once_t pred = 0;
    static HealthKitManager *instance = nil;
    dispatch_once(&pred, ^{
        instance = [[HealthKitManager alloc]init];
        instance.healthStore = [[HKHealthStore alloc]init];
    });
    return instance;
}

// singleton object creation as apple says only one instance of the healthstore should be there.
// dispatch_once function is GCD so it is safe from multiple thread calls.


@end
