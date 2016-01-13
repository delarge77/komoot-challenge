//
//  KCPhoto.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <CoreLocation/CoreLocation.h>
#import <MTLModel.h>
#import <MTLJSONAdapter.h>
/*
 {
     "photos": [
         {
             "photo_id": 532693,
             "photo_title": "Wheatfield in afternoon light",
             "photo_url": "http://www.panoramio.com/photo/532693",
             "photo_file_url": "http://static2.bareka.com/photos/medium/532693.jpg",
             "longitude": 11.280727,
             "latitude": 59.643198,
             "width": 500,
             "height": 333,
             "upload_date": "22 January 2007",
             "owner_id": 39160,
             "owner_name": "Snemann",
             "owner_url": "http://www.panoramio.com/user/39160",
         }
     ]
 }
 */

@interface KCPhoto : MTLModel <MTLJSONSerializing>

@property (assign, nonatomic, readonly) NSUInteger photo_id;
@property (copy, nonatomic, readonly) NSString *photo_title;
@property (copy, nonatomic, readonly) NSString *photo_url;
@property (copy, nonatomic, readonly) NSString *photo_file_url;
@property (nonatomic, readonly) float longitude;
@property (nonatomic, readonly) float latitude;
@property (assign, nonatomic, readonly) NSUInteger width;
@property (assign, nonatomic, readonly) NSUInteger height;
@property (copy, nonatomic, readonly) NSString *upload_date;
@property (assign, nonatomic, readonly) NSUInteger owner_id;
@property (copy, nonatomic, readonly) NSString *owner_name;
@property (copy, nonatomic, readonly) NSString *owner_url;


@end
