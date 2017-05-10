#import "MarkerChangeText.h"
@import Wrld;


@interface MarkerChangeText ()

@property (nonatomic) WRLDMapView *mapView;

@end

@implementation MarkerChangeText
{
    BOOL titleToggle;
    NSString* title1;
    NSString* title2;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    titleToggle = false;
    title1 = @"Initial marker text";
    title2 = @"Altered marker text";
    
    _mapView = [[WRLDMapView alloc] initWithFrame:self.view.bounds];
    
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(37.7858, -122.401)
                        zoomLevel:15
                         animated:NO];
    
    [self.view addSubview:_mapView];
    
    WRLDMarker* marker = [WRLDMarker markerAtCoordinate:CLLocationCoordinate2DMake(37.7858, -122.401)];
    marker.title = title1;
    [_mapView addMarker:marker];
    
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(onDelay:)
                                   userInfo:marker
                                    repeats:YES];
    
    
    
}

- (void)onDelay:(NSTimer *)timer
{
    WRLDMarker* marker = timer.userInfo;
    marker.title = titleToggle ? title1 : title2;
    titleToggle = !titleToggle;
}

@end