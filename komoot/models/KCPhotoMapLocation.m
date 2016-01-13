//
//  KCPhotoMapLocatopn.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCPhotoMapLocation.h"

@implementation KCPhotoMapLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{@"lat":@"lat",
             @"lon":@"lon",
             @"panoramio_zoom":@"panoramio_zoom"};

}


@end
