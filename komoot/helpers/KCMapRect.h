//
//  MapRect.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface KCMapRect : NSObject

+ (MKMapRect) getMapRectFromLocation:(CLLocationCoordinate2D) userLocation;

@end
