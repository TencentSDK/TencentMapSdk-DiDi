//
//  QMapAppDelegate.h
//  TencentMapSdk-DiDi
//
//  Created by eximpression on 05/27/2017.
//  Copyright (c) 2017 eximpression. All rights reserved.
//

@import UIKit;
#import <QMapKit.h>
@interface QMapAppDelegate : UIResponder <UIApplicationDelegate,QAppKeyCheckDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, strong) QAppKeyCheck       *appKeyCheck;
@end
