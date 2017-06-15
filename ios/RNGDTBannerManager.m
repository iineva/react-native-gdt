//
//  RNGDTBannerManager.m
//  RNGdt
//
//  Created by Steven on 2017/6/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNGDTBannerManager.h"
#import "RNGDTBanner.h"

@implementation RNGDTBannerManager

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_VIEW_PROPERTY(interval, int);
RCT_EXPORT_VIEW_PROPERTY(isGpsOn, BOOL);
RCT_EXPORT_VIEW_PROPERTY(isAnimationOn, BOOL);
RCT_EXPORT_VIEW_PROPERTY(showCloseBtn, BOOL);
RCT_EXPORT_VIEW_PROPERTY(appInfo, NSDictionary);

RCT_EXPORT_VIEW_PROPERTY(onReceived, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onFailToReceived, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onViewWillLeaveApplication, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onViewWillClose, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onViewWillExposure, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onClicked, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onViewWillPresentFullScreenModal, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onViewDidPresentFullScreenModal, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onViewWillDismissFullScreenModal, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onViewDidDismissFullScreenModal, RCTBubblingEventBlock);

- (UIView *)view {
    return [[RNGDTBanner alloc] init];
}

@end
