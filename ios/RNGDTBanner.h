//
//  RNGDTBanner.h
//  RNGdt
//
//  Created by Steven on 2017/6/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTViewManager.h>

@interface RNGDTBanner : UIView

@property (nonatomic, strong) NSDictionary * appInfo;

@property (nonatomic, assign) int interval;
@property (nonatomic, assign) BOOL isGpsOn;
@property (nonatomic, assign) BOOL isAnimationOn;
@property (nonatomic, assign) BOOL showCloseBtn;

@property (nonatomic, copy) RCTBubblingEventBlock onReceived;
@property (nonatomic, copy) RCTBubblingEventBlock onFailToReceived;
@property (nonatomic, copy) RCTBubblingEventBlock onViewWillLeaveApplication;
@property (nonatomic, copy) RCTBubblingEventBlock onViewWillClose;
@property (nonatomic, copy) RCTBubblingEventBlock onViewWillExposure;
@property (nonatomic, copy) RCTBubblingEventBlock onClicked;
@property (nonatomic, copy) RCTBubblingEventBlock onViewWillPresentFullScreenModal;
@property (nonatomic, copy) RCTBubblingEventBlock onViewDidPresentFullScreenModal;
@property (nonatomic, copy) RCTBubblingEventBlock onViewWillDismissFullScreenModal;
@property (nonatomic, copy) RCTBubblingEventBlock onViewDidDismissFullScreenModal;

@end
