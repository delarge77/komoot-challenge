//
//  KCKomootClient.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCKomootClient.h"
#import "AFNetworkActivityIndicatorManager.h"

NSString *KCKomootClientURL = @"http://www.panoramio.com/";

@implementation KCKomootClient

+ (instancetype) sharedClient {

    static KCKomootClient * _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[KCKomootClient alloc] initWithBaseURL:[NSURL URLWithString:KCKomootClientURL]];
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    }
    
    return self;
}

@end
