//
//  KCConnectionBlocks.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

typedef void (^KCCompletionBlock)(NSError *error);

typedef void (^KCObjectCompletionBlock)(id object, NSError *error);

typedef void (^KCArrayCompletionBlock)(NSArray *array, NSError *error);
