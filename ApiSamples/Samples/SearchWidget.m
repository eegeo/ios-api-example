#import "SearchWidget.h"
#import "SamplesMessage.h"

@import Wrld;
@import WrldWidgets;

@implementation SearchWidget
{
    WRLDSearchWidgetViewController *m_searchWidgetViewController;
    WRLDSearchWidgetView *m_searchWidgetView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    WRLDMapView *mapView = [[WRLDMapView alloc] initWithFrame:self.view.bounds];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(37.7858, -122.401)
                       zoomLevel:15
                        animated:NO];
    [self.view addSubview:mapView];
    
    m_searchWidgetViewController = [[WRLDSearchWidgetViewController alloc] init];
    
    m_searchWidgetView = [[WRLDSearchWidgetView alloc ] initWithFrame:CGRectMake(10, 10, 300, 500)];
    //[m_searchWidgetView setSearchModule:m_searchWidgetViewController];
    //[m_searchWidgetView setMapView:mapView];
    [self.view addSubview:m_searchWidgetView];
}

@end

