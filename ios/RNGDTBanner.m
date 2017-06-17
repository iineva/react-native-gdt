//
//  RNGDTBanner.m
//  RNGdt
//
//  Created by Steven on 2017/6/14.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RNGDTBanner.h"
#import "GDTMobBannerView.h"

@interface RNGDTBanner() <GDTMobBannerViewDelegate>

@property (nonatomic, strong) GDTMobBannerView * bannerView;

@end

@implementation RNGDTBanner

- (void)setAppInfo:(NSDictionary *)appInfo {
    if (self.bannerView) {
        self.bannerView.delegate = nil;
        self.bannerView.currentViewController = nil;
        [self.bannerView removeFromSuperview];
    }
    self.bannerView = [[GDTMobBannerView alloc] initWithFrame:self.bounds
                                                       appkey:appInfo[@"appId"]
                                                  placementId:appInfo[@"placementId"]];
    self.bannerView.delegate = self;
    self.bannerView.currentViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [self addSubview:self.bannerView];
    self.bannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.bannerView loadAdAndShow];
    });
}

- (void)setInterval:(int)interval { self.bannerView.interval = interval; }
- (int)interval { return self.bannerView.interval; }
- (void)setIsGpsOn:(BOOL)isGpsOn { self.bannerView.isGpsOn = isGpsOn; }
- (BOOL)isGpsOn { return self.bannerView.isGpsOn; }
- (void)setIsAnimationOn:(BOOL)isAnimationOn { self.bannerView.isAnimationOn = isAnimationOn; }
- (BOOL)isAnimationOn { return self.bannerView.isAnimationOn; }
- (void)setShowCloseBtn:(BOOL)showCloseBtn { self.bannerView.showCloseBtn = showCloseBtn; }
- (BOOL)showCloseBtn { return self.bannerView.showCloseBtn; }

#pragma mark - GDTMobBannerViewDelegate

- (void)bannerViewMemoryWarning {
    NSLog(@"bannerViewMemoryWarning");
}

/**
 *  请求广告条数据成功后调用
 *  详解:当接收服务器返回的广告数据成功后调用该函数
 */
- (void)bannerViewDidReceived {
    if (self.onReceived) {
        self.onReceived(nil);
    }
}

/**
 *  请求广告条数据失败后调用
 *  详解:当接收服务器返回的广告数据失败后调用该函数
 */
- (void)bannerViewFailToReceived:(NSError *)error {
    if (self.onFailToReceived) {
        self.onFailToReceived(@{@"error": error.localizedDescription});
    }
}

/**
 *  应用进入后台时调用
 *  详解:当点击应用下载或者广告调用系统程序打开，应用将被自动切换到后台
 */
- (void)bannerViewWillLeaveApplication {
    if (self.onViewWillLeaveApplication) {
        self.onViewWillLeaveApplication(nil);
    }
}

/**
 *  banner条被用户关闭时调用
 *  详解:当打开showCloseBtn开关时，用户有可能点击关闭按钮从而把广告条关闭
 */
- (void)bannerViewWillClose {
    if (self.onViewWillClose) {
        self.onViewWillClose(nil);
    }
}

/**
 *  banner条曝光回调
 */
- (void)bannerViewWillExposure {
    if (self.onViewWillExposure) {
        self.onViewWillExposure(nil);
    }
}

/**
 *  banner条点击回调
 */
- (void)bannerViewClicked {
    if (self.onClicked) {
        self.onClicked(nil);
    }
}

/**
 *  banner广告点击以后即将弹出全屏广告页
 */
- (void)bannerViewWillPresentFullScreenModal {
    if (self.onViewWillPresentFullScreenModal) {
        self.onViewWillPresentFullScreenModal(nil);
    }
}

/**
 *  banner广告点击以后弹出全屏广告页完毕
 */
- (void)bannerViewDidPresentFullScreenModal {
    if (self.onViewDidPresentFullScreenModal) {
        self.onViewDidPresentFullScreenModal(nil);
    }
}

/**
 *  全屏广告页即将被关闭
 */
- (void)bannerViewWillDismissFullScreenModal {
    if (self.onViewWillDismissFullScreenModal) {
        self.onViewWillDismissFullScreenModal(nil);
    }
}

/**
 *  全屏广告页已经被关闭
 */
- (void)bannerViewDidDismissFullScreenModal {
    if (self.onViewDidDismissFullScreenModal) {
        self.onViewDidDismissFullScreenModal(nil);
    }
}

@end
