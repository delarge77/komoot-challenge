//
//  KCPhoto.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCPhoto.h"

@implementation KCPhoto

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{@"photo_id":@"photo_id",
             @"photo_title":@"photo_title",
             @"photo_url":@"photo_url",
             @"photo_file_url":@"photo_file_url",
             @"latitude":@"latitude",
             @"longitude":@"longitude",
             @"width":@"width",
             @"height":@"height",
             @"upload_date":@"upload_date",
             @"owner_id":@"owner_id",
             @"owner_name":@"owner_name",
             @"owner_url":@"owner_url"};
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

@end
