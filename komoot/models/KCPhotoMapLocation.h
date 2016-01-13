//
//  KCPhotoMapLocatopn.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>

/*"map_location" =     {
    lat = "0.6099695000000018";
    lon = "-27.568517";
    "panoramio_zoom" = 16;
};*/

@interface KCPhotoMapLocation : MTLModel <MTLJSONSerializing>

@property (assign, readonly, nonatomic) CGFloat lat;
@property (assign, readonly, nonatomic) CGFloat lon;
@property (assign, nonatomic) NSUInteger panoramio_zoom;

@end
