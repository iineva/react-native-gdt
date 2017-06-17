/**
 * Created by steven on 2017/6/15.
 */

package com.ineva.gdt;

import android.graphics.Color;
import android.support.annotation.Nullable;
import android.widget.FrameLayout;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.uimanager.events.RCTEventEmitter;
import com.facebook.react.views.view.ReactViewGroup;
import com.qq.e.ads.banner.ADSize;
import com.qq.e.ads.banner.AbstractBannerADListener;
import com.qq.e.ads.banner.BannerView;

import java.util.Map;

public class RNGDTBannerManager extends SimpleViewManager {

    @Override
    public String getName() {
        return "RNGDTBanner";
    }

    public enum Events {
        EVENT_FAILT_TO_RECEIVED("onFailToReceived"),
        EVENT_RECEIVED("onReceived"),
        EVENT_WILL_LEAVE_APP("onViewWillLeaveApplication"),
        EVENT_WILL_CLOSE("onViewWillClose"),
        EVENT_WILL_EXPOSURE("onViewWillExposure"),
        EVENT_ON_CLICK("onClicked"),
        EVENT_WILL_OPEN_FULL_SCREEN("onViewWillPresentFullScreenModal"),
        EVENT_DID_OPEN_FULL_SCREEN("onViewDidPresentFullScreenModal"),
        EVENT_WILL_CLOSE_FULL_SCREEN("onViewWillDismissFullScreenModal"),
        EVENT_DID_CLOSE_FULL_SCREEN("onViewDidDismissFullScreenModal");

        private final String mName;

        Events(final String name) {
            mName = name;
        }

        @Override
        public String toString() {
            return mName;
        }
    }

    private ReactViewGroup mView;
    private RCTEventEmitter mEventEmitter;
    private ThemedReactContext mThemedReactContext;
    private BannerView mBanner;

    @Override
    protected ReactViewGroup createViewInstance(ThemedReactContext themedReactContext) {
        mThemedReactContext = themedReactContext;
        mEventEmitter = themedReactContext.getJSModule(RCTEventEmitter.class);
        mView = new ReactViewGroup(themedReactContext);
        return mView;
    }

    @Override
    @Nullable
    public Map<String, Object> getExportedCustomDirectEventTypeConstants() {
        MapBuilder.Builder<String, Object> builder = MapBuilder.builder();
        for (Events event : Events.values()) {
            builder.put(event.toString(), MapBuilder.of("registrationName", event.toString()));
        }
        return builder.build();
    }


    @ReactProp(name = "appInfo")
    public void setAppInfo(final ReactViewGroup view, final ReadableMap appInfo) {

        BannerView banner = new BannerView(mThemedReactContext.getCurrentActivity(), ADSize.BANNER, appInfo.getString("appId"), appInfo.getString("placementId"));

        mBanner = banner;

        banner.setLayoutParams(new FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        ));

        banner.setADListener(new AbstractBannerADListener() {

            @Override
            public void onNoAD(int arg0) {
                WritableMap event = Arguments.createMap();
                event.putString("error", "BannerNoAD，eCode=" + arg0);
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_FAILT_TO_RECEIVED.toString(), event);
            }

            @Override
            public void onADReceiv() {
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_RECEIVED.toString(), null);
            }

            @Override
            public void onADLeftApplication() {
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_WILL_LEAVE_APP.toString(), null);
            }

            @Override
            public void onADClosed() {
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_WILL_CLOSE.toString(), null);
            }

            @Override
            public void onADExposure() {
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_WILL_EXPOSURE.toString(), null);
            }

            @Override
            public void onADClicked() {
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_ON_CLICK.toString(), null);
            }

            @Override
            public void onADOpenOverlay() {
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_WILL_OPEN_FULL_SCREEN.toString(), null);
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_DID_OPEN_FULL_SCREEN.toString(), null);
            }

            @Override
            public void onADCloseOverlay() {
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_WILL_CLOSE_FULL_SCREEN.toString(), null);
                mEventEmitter.receiveEvent(view.getId(), Events.EVENT_DID_CLOSE_FULL_SCREEN.toString(), null);
            }

        });

        BannerView oldAdView = (BannerView) view.getChildAt(0);
        view.removeAllViews();
        if (oldAdView != null) oldAdView.destroy();
        view.addView(banner);
        banner.loadAD();
    }

    @ReactProp(name = "interval")
    public void setInterval(final ReactViewGroup view, final int interval) {
        mBanner.setRefresh(interval);
    }

    @ReactProp(name = "showCloseBtn")
    public void setShowCloseBtn(final ReactViewGroup view, final boolean showCloseBtn) {
        mBanner.setShowClose(showCloseBtn);
    }

}
