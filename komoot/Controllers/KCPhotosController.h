//
//  KCPhotosController.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KCConnectionBlocks.h"
#import <CoreLocation/CoreLocation.h>

extern NSString *KCPhotosControllerErrorDomain;

typedef NS_ENUM(NSUInteger, KCPhotosControllerErrorCode) {
    KCPhotosControllerErrorCodeConnectionProblem,
    KCPhotosControllerErrorCodeBadRequest,
    KCPhotosControllerErrorCodeServerError,
};

@interface KCPhotosController : NSObject

+ (NSURLSessionTask *) loadPhotosWithMinx:(float) minx
                                     miny:(float) miny maxx:(float) maxx
                                     maxy:(float) maxy
                    withCompletionHandler:(KCObjectCompletionBlock)completionBlock;


@end
