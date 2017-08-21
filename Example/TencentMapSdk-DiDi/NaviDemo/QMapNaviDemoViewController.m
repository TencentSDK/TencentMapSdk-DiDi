//
//  QMapNaviDemoViewController.m
//  QMapKitDemoNew
//
//  Created by ZhangChao on 2017/3/6.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "QMapNaviDemoViewController.h"
#import <QMapKit.h>
#import <DDLine.h>
@interface QMapNaviDemoViewController () <QSearchDelegate>
@property (weak, nonatomic) IBOutlet QMapView *mapview;
@property(nonatomic,strong)QSearch* search;
@property(nonatomic,strong)NSMutableArray* lineArray;
@end

@implementation QMapNaviDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lineArray = [[NSMutableArray alloc]init];
    self.mapview.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNav
{
    self.search.delegate = nil;
    self.search = nil;
    self.search = [[QSearch alloc] init];
    self.search.delegate = self;
    
    self.search.qOrderExtraInfo = [[QOrderExtraInfo alloc]init];
    self.search.qOrderExtraInfo.order_id = @"123456";
    self.search.qOrderExtraInfo.nav_scene = 2;
    self.search.qOrderExtraInfo.biz_type = @"kuaiche_test";
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)calculateRouteWithPasses:(id)sender {
    QPlaceInfo* place1 = [[QPlaceInfo alloc]init];
    place1.coordinate = CLLocationCoordinate2DMake(40.052010000000003, 116.28816999999999);
    QPlaceInfo* place2 = [[QPlaceInfo alloc]init];
    place2.coordinate = CLLocationCoordinate2DMake(40.051938, 116.288866);
    QPlaceInfo* place3 = [[QPlaceInfo alloc]init];
    place3.coordinate = CLLocationCoordinate2DMake(40.052045861480998, 116.28896087408);
    QPlaceInfo* place4 = [[QPlaceInfo alloc]init];
    place4.coordinate = CLLocationCoordinate2DMake(40.051048999999999, 116.30700899999999);
    QPlaceInfo* place5 = [[QPlaceInfo alloc]init];
    place5.coordinate = CLLocationCoordinate2DMake(40.053424, 116.30556);
    QPlaceInfo* place6 = [[QPlaceInfo alloc]init];
    place6.coordinate = CLLocationCoordinate2DMake(40.052384000000004, 116.30632);
    
    DDLine* line1 = [[DDLine alloc]init];
    line1.startPoint = place1;
    line1.endPoint = place2;
    line1.lineWith = 10;
    line1.lineColor = 0;
    
    DDLine* line2 = [[DDLine alloc]init];
    line2.startPoint = place2;
    line2.endPoint = place3;
    line2.lineWith = 10;
    line2.lineColor = 1;
    
    DDLine* line3 = [[DDLine alloc]init];
    line3.startPoint = place3;
    line3.endPoint = place4;
    line3.lineWith = 10;
    line3.lineColor = 2;
    
    DDLine* line4 = [[DDLine alloc]init];
    line4.startPoint = place4;
    line4.endPoint = place5;
    line4.lineWith = 10;
    line4.lineColor = 3;
    
    DDLine* line5 = [[DDLine alloc]init];
    line5.startPoint = place5;
    line5.endPoint = place6;
    line5.lineWith = 10;
    line5.lineColor = 5;
    
    [self.lineArray addObject:line1];
    [self.lineArray  addObject:line2];
    [self.lineArray  addObject:line3];
    [self.lineArray  addObject:line4];
    [self.lineArray  addObject:line5];
    
    [self initNav];
    
    QDriveSearchType searchType = QDriveSearchShortTime;
    
    [self.search navRouteSearchWithLocationArray:_lineArray  withDriveSearchType:searchType noHighway:YES];
}


-(void)notifyNavRouteSearchResult:(RouteResult *)routeSearchResult
{
    NSLog(@"notifyNavRouteSearchResult");
    
    QMapRect rect = [routeSearchResult rectForSelectedRoute];
    
    routeSearchResult.bHidePoints = NO;
    routeSearchResult.bHideArrow = NO;
    if ([routeSearchResult isTypeCar]) {
        if (routeSearchResult.routes.count > 0) {
            //如果想用路况，或者纯色，请用此方法
            //[self.mapview showSearchRoute:routeSearchResult routeColor:RC_TRAFFIC];
            //如果用DDLine指定的颜色，用此方法画路
              [self.mapview showSearchRoute:routeSearchResult lineArray:self.lineArray];
        }
    }
}

-(IBAction)startNaviAction:(id)sender
{
    //self.mapview.forbidRecaculate = NO;
    [self.mapview startNavigation:YES];
    [ [ UIApplication sharedApplication] setIdleTimerDisabled:YES ] ;
}
-(IBAction)continueNaviAction:(id)sender
{
    
    [self.mapview continueNavigation];
}
-(IBAction)stopNaviAction:(id)sender
{
    [self.mapview stopNavigation];
}
@end
