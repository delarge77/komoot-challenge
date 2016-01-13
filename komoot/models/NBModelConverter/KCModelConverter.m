//
//  KCModelConverter.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCModelConverter.h"

@implementation KCModelConverter

+ (id)convertModelFromJSON:(NSDictionary *)JSON class:(Class)classToParse {
    NSParameterAssert(classToParse != nil);
    
    @try {
        NSError *error = nil;
        id object = [MTLJSONAdapter modelOfClass:classToParse
                              fromJSONDictionary:JSON
                                           error:&error];
        if (!error) {
            return object;
        } else {
            return nil;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
}

+ (NSArray *)convertModelsFromJSON:(NSArray *)JSON class:(Class)classToParse {
    NSParameterAssert(classToParse != nil);
    
    @try {
        NSError *error = nil;
        NSArray *objects = [MTLJSONAdapter modelsOfClass:classToParse
                                           fromJSONArray:JSON
                                                   error:&error];
        if (!error) {
            return objects;
        } else {
            return nil;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
}


@end
