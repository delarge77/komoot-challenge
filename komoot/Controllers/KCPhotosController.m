//
//  KCPhotosController.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCPhotosController.h"
#import "KCKomootClient.h"
#import "KCModelConverter.h"
#import "KCPhotoModel.h"

NSString *KCPhotosControllerErrorDomain = @"de.com.komoot:KCPhotosControllerErrorDomain";

@implementation KCPhotosController

#pragma mark - private methods

+ (NSURLSessionTask *) loadPhotosWithMinx:(float) minx
                                     miny:(float) miny
                                     maxx:(float) maxx
                                     maxy:(float) maxy
                    withCompletionHandler:(KCObjectCompletionBlock)completionBlock {
    
    
    NSString *minX = [NSString stringWithFormat:@"%f", minx];
    NSString *minY = [NSString stringWithFormat:@"%f", miny];
    NSString *maxX = [NSString stringWithFormat:@"%f", maxx];
    NSString *maxY = [NSString stringWithFormat:@"%f", maxy];
    
    NSDictionary *params = @{@"set":@"full", @"from":@"0", @"to":@"1", @"minx":minX, @"miny":minY, @"maxx":maxX, @"maxy":maxY, @"size":@"medium", @"mapfilter":@"true"};
    
    return [[KCKomootClient sharedClient] GET:@"map/get_panoramas.php" parameters:params progress:nil
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                    
          NSArray *photosResults = [KCModelConverter convertModelFromJSON:responseObject
                                                                   class:[KCPhotoModel class]];

          completionBlock(photosResults, nil);
                                    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([error.domain isEqualToString:NSURLErrorDomain]) {
            
            error = [self buildConnectionProblemError];
            if (completionBlock) completionBlock(nil, error);
            return;
        }
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode >= 400 && response.statusCode <= 499) {
            error = [self build400Error];
        }
        if (response.statusCode >= 500 && response.statusCode <= 599) {
            error = [self build500Error];
        }
        
        if (completionBlock) completionBlock(nil, error);
    }];
    
}

+ (NSError *)buildConnectionProblemError {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : @"There is no internet connection"};
    
    return [NSError errorWithDomain:KCPhotosControllerErrorDomain
                               code:KCPhotosControllerErrorCodeConnectionProblem
                           userInfo:userInfo];
}

+ (NSError *)build400Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : @"Something went wrong"};
    
    return [NSError errorWithDomain:KCPhotosControllerErrorDomain
                               code:KCPhotosControllerErrorCodeBadRequest
                           userInfo:userInfo];
}

+ (NSError *)build500Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey :@"Sorry , we are facing some problems. Try again later."};
    
    return [NSError errorWithDomain:KCPhotosControllerErrorDomain
                               code:KCPhotosControllerErrorCodeServerError
                           userInfo:userInfo];
}

@end
