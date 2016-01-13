//
//  KCPhotoModel.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <MTLJSONAdapter.h>
#import "KCPhotoMapLocation.h"

/*{
    count = 3751;
    "has_more" = 1;
    "map_location" =     {
        lat = "0.6099695000000018";
        lon = "-27.568517";
        "panoramio_zoom" = 16;
    };
    photos =     (
                  {
                      height = 375;
                      latitude = "-46.647138";
                      longitude = "-72.607527";
                      "owner_id" = 947917;
                      "owner_name" = Dejah;
                      "owner_url" = "http://www.panoramio.com/user/947917";
                      "photo_file_url" = "http://mw2.google.com/mw-panoramio/photos/medium/9363990.jpg";
                      "photo_id" = 9363990;
                      "photo_title" = "Marble Cave";
                      "photo_url" = "http://www.panoramio.com/photo/9363990";
                      "upload_date" = "14 April 2008";
                      width = 500;
                  }
                  );
}*/

@interface KCPhotoModel : MTLModel <MTLJSONSerializing>

@property (assign, readonly, nonatomic) NSUInteger count;
@property (assign, readonly, nonatomic) BOOL hasMore;
@property (copy, readonly, nonatomic) KCPhotoMapLocation *maplocation;
@property (copy, readonly, nonatomic) NSArray *photos; // KCPhoto

@end
