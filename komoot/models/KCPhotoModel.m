//
//  KCPhotoModel.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCPhotoModel.h"
#import "KCPhoto.h"

@implementation KCPhotoModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {

    return @{@"count":@"count",
             @"hasMore":@"hasMore",
             @"maplocation":@"map_location",
             @"photos":@"photos"};
}

+ (NSValueTransformer *)photosJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[KCPhoto class]];
}

+ (NSValueTransformer *)map_locationJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[KCPhotoMapLocation class]];
}


@end
