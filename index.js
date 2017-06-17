import React, { Component } from 'react'
import {View} from 'react-native'
import PropTypes from 'prop-types'
import { requireNativeComponent } from 'react-native'


export class Banner extends Component {
  static propTypes = {

    ...View.propTypes,

    appInfo: PropTypes.shape({
      appId: PropTypes.string,
      placementId: PropTypes.string,
    }),
    /**
     *  广告刷新间隔 [可选]
     */
    interval: PropTypes.number,
    /**
     *  GPS精准广告定位模式开关,默认Gps关闭
     *  iOS only
     *  详解：[可选]GPS精准定位模式开关，YES为开启GPS，NO为关闭GPS，建议设为开启，可以获取地理位置信息，提高广告的填充率，增加收益。
     */
    isGpsOn: PropTypes.bool,
    /**
     *  Banner展现和轮播时的动画效果开关，默认打开
     *  iOS only
     */
    isAnimationOn: PropTypes.bool,
    /**
     *  Banner条展示关闭按钮，默认打开
     */
    showCloseBtn: PropTypes.bool,


    /**
     *  请求广告条数据成功后调用
     *  详解:当接收服务器返回的广告数据成功后调用该函数
     */
    onReceived: PropTypes.func,
    /**
     *  请求广告条数据失败后调用
     *  详解:当接收服务器返回的广告数据失败后调用该函数
     */
    onFailToReceived: PropTypes.func,
    /**
     *  应用进入后台时调用
     *  详解:当点击应用下载或者广告调用系统程序打开，应用将被自动切换到后台
     */
    onViewWillLeaveApplication: PropTypes.func,
    /**
     *  banner条被用户关闭时调用
     *  详解:当打开showCloseBtn开关时，用户有可能点击关闭按钮从而把广告条关闭
     */
    onViewWillClose: PropTypes.func,
    /**
     *  banner条曝光回调
     */
    onViewWillExposure: PropTypes.func,
    /**
     *  banner条点击回调
     */
    onClicked: PropTypes.func,
    /**
     *  banner广告点击以后即将弹出全屏广告页
     */
    onViewWillPresentFullScreenModal: PropTypes.func,
    /**
     *  banner广告点击以后弹出全屏广告页完毕
     */
    onViewDidPresentFullScreenModal: PropTypes.func,
    /**
     *  全屏广告页即将被关闭
     */
    onViewWillDismissFullScreenModal: PropTypes.func,
    /**
     *  全屏广告页已经被关闭
     */
    onViewDidDismissFullScreenModal: PropTypes.func,
  }

  _onFailToReceived(event) {
    this.props.onFailToReceived && this.props.onFailToReceived(new Error(event.nativeEvent.error))
  }

  render() {
    return <RNGDTBanner {...this.props} onFailToReceived={this.props.onFailToReceived && this._onFailToReceived.bind(this)} />
  }
}

const RNGDTBanner = requireNativeComponent('RNGDTBanner', Banner)
