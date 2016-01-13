//
//  ViewController.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCPhotosViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "CLLocation+KCPhotoLocation.h"
#import "KCPhotosController.h"
#import "KCPhotoCardCell.h"
#import "KCPhotoModel.h"
#import "KCPhoto.h"
#import "KCMapRect.h"

@interface KCPhotosViewController () <CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) CLLocation * currentLocation;
@property (strong, nonatomic) CLLocationManager * locationManager;
@property (strong, nonatomic) NSMutableArray *userPhotos;
@property (weak, nonatomic) IBOutlet UITableView *photosTableView;


@end

@implementation KCPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    self.userPhotos = [[NSMutableArray alloc] init];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager setDistanceFilter:100];
     [self.locationManager startMonitoringSignificantLocationChanges];
    [self.locationManager startUpdatingLocation];
}

- (void) setupView {

    [self.navigationItem setHidesBackButton:YES];

    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Stop" style:UIBarButtonItemStylePlain target:self action:@selector(stopUpdatingUserLocation)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

#pragma mark - UITableView Datasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.userPhotos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"photoCell";
    
    KCPhotoCardCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"KCPhotoCardCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    KCPhoto *photo = self.userPhotos[indexPath.row];
    
    [cell showPhotoCard:photo];
    
    return cell;
}

#pragma mark - UITableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 220;
}

#pragma mark - CLLocation Datasource Methods

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = locations.lastObject;
    
    NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0) return;
    
    if (newLocation.horizontalAccuracy < 0) return;
    
    CLLocation *locaiontionOne = [[CLLocation alloc] initWithLatitude:self.currentLocation.coordinate.latitude longitude:self.currentLocation.coordinate.longitude];
    CLLocation *locationTwo = [[CLLocation alloc] initWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
    double distance = [locaiontionOne distanceFromLocation:locationTwo];
    _currentLocation = newLocation;
    
    if(distance > 20)
    {
        self.currentLocation = (CLLocation *)[locations lastObject];
        [self getPhotoFromUserRegion:self.currentLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Location manager failed with error: %@", error);
    if ([error.domain isEqualToString:kCLErrorDomain] && error.code == kCLErrorDenied) {
        [manager stopUpdatingLocation];
    }
}

#pragma mark - Private Methods

- (void) getPhotoFromUserRegion:(CLLocation *) userCoordinate {
    
    MKMapRect coord = [KCMapRect getMapRectFromLocation:userCoordinate.coordinate];
    
    __weak typeof(self) weakSelf = self;

    [self showLoadingMessage:@"Loading photo ..."];
    
    [KCPhotosController loadPhotosWithMinx:coord.origin.y miny:coord.origin.x maxx:coord.size.height maxy:coord.size.width withCompletionHandler:^(id object, NSError *error) {
        
        [weakSelf dismissHud];
        if (error) {
            [weakSelf presentError:error inView:self.view];
            return;
        }
        self.photosTableView.tableFooterView = [UIView new];
        [weakSelf updateTableViewWithNewPicture:object];

    }];
}

- (void) updateTableViewWithNewPicture:(KCPhotoModel *) model {

    if (model) {
        self.photosTableView.hidden = NO;
        KCPhoto *photo = [model.photos objectAtIndex:0];
        
        [self.photosTableView beginUpdates];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.userPhotos insertObjects:[NSArray arrayWithObjects:photo, nil] atIndexes:indexSet];
        [self.photosTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.photosTableView endUpdates];
    }
    
}

- (void) stopUpdatingUserLocation{

    [self.locationManager stopUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
