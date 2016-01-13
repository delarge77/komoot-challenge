//
//  KCKomootClient.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface KCKomootClient : AFHTTPSessionManager

+ (instancetype) sharedClient;

@end
