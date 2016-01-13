//
//  CLLocation+KCPhotoLocation.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKGeometry.h>

@interface CLLocation (KCPhotoLocation)

extern const CLLocationCoordinate2D CLNorthWestCoordinateFromRegion(MKCoordinateRegion region);
extern const CLLocationCoordinate2D CLSouthWestCoordinateFromRegion(MKCoordinateRegion region);
extern const CLLocationCoordinate2D CLSouthEastCoordinateFromRegion(MKCoordinateRegion region);
extern const CLLocationCoordinate2D CLNorthEastCoordinateFromRegion(MKCoordinateRegion region);

@end
