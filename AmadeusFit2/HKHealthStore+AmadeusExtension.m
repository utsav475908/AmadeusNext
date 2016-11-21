//
//  HKHealthStore+AmadeusExtension.m
//  AmadeusFit2
//
//  Created by kumar on 21/11/16.
//  Copyright © 2016 kumar. All rights reserved.
//

#import "HKHealthStore+AmadeusExtension.h"

@implementation HKHealthStore (AmadeusExtension)

-(void)giveMeTheMostRecentQuantitySampleOfType:(HKQuantityType *)quantityType predicate:(NSPredicate *)predicate completion:(void(^)(HKQuantity *, NSError *))completion{
    NSSortDescriptor *sortWithRespectToTime = [[NSSortDescriptor alloc]initWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    // Target is to retrieve the latest sample , so we will sort the samples in descending order , the limit is set to 1. as we do not intend to filter the set of data and so the predicate is set to nil
    HKSampleQuery *query = [[HKSampleQuery alloc]initWithSampleType:quantityType predicate:nil limit:1 sortDescriptors:@[sortWithRespectToTime] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        if(!results){// results are not there or available to us then what to do
            if(completion){
                completion(nil,error);
            }
            return;
        }
        if(completion){
            HKQuantitySample *quantitySample = results.firstObject;
            HKQuantity *quantity = quantitySample.quantity;
            completion(quantity,error);
        }
        
    }];
    [self executeQuery:query];
}


@end
