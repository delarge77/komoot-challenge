//
//  KCMapRect.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCMapRect.h"

@implementation KCMapRect

+ (MKMapRect) getMapRectFromLocation:(CLLocationCoordinate2D) userLocation {
    
    double halfSideInKm=1;
    //gets radians from degrees
    double lat = [self degrees2Radians:(userLocation.latitude)] ;
    double lon =[self degrees2Radians:userLocation.longitude];
    double halfSide = 1000*halfSideInKm;
    
    //gets WGS84 earth radius at latitude
    double radius =[self WGS84EarthRadiusAtLatitude:lat];
    double pradius = radius*cos(lat);
    
    double latMin = lat - halfSide/radius;
    double latMax = lat + halfSide/radius;
    double lonMin = lon - halfSide/pradius;
    double lonMax = lon + halfSide/pradius;
    return MKMapRectMake(
                         [self radians2Degrees:latMin],
                         [self radians2Degrees:lonMin],
                         [self radians2Degrees:latMax],
                         [self radians2Degrees:lonMax]);
    
}

+ (double) degrees2Radians:(double) degrees {
    return degrees * M_PI / 180.0;
}

+ (double) radians2Degrees:(double) radians {
    return radians * 180.0 / M_PI;
}

+ (double) WGS84EarthRadiusAtLatitude:(double) latitude {
    
    double An = pow([self WGS84_a], 2) * cos(latitude);
    double Bn = pow([self WGS84_b], 2) * sin(latitude);
    double Ad = [self WGS84_a] * cos(latitude);
    double Bd = [self WGS84_b] * sin(latitude);
    return sqrt( (An*An + Bn*Bn)/(Ad*Ad + Bd*Bd) );
    
}

//geocentric gravitational constant
+ (double) WGS84_a{
    return 6378137.0;
}

+ (double) WGS84_b{
    return 6356752.3142;
}

+ (double) WGS84_f{
    return 1/298.257223563;
}

+ (double) WGS84_u{
    return 3986005 * pow(10,8);
}


@end
