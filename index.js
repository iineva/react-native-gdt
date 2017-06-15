import React, { Component } from 'react';
import PropTypes from 'prop-types'
import { requireNativeComponent } from 'react-native'

export class Banner extends Component {
  static propTypes = {

    appInfo: PropTypes.shape({
      appKey: PropTypes.string,
      placementId: PropTypes.string,
    }),
    /**
     *  广告刷新间隔 [可选]
     */
    interval: PropTypes.number,
    /**
     *  GPS精准广告定位模式开关,默认Gps关闭
     *  详解：[可选]GPS精准定位模式开关，YES为开启GPS，NO为关闭GPS，建议设为开启，可以获取地理位置信息，提高广告的填充率，增加收益。
     */
    isGpsOn: PropTypes.bool,
    /**
     *  Banner展现和轮播时的动画效果开关，默认打开
     */
    isAnimationOn: PropTypes.bool,
    /**
     *  Banner条展示关闭按钮，默认打开
     */
    showCloseBtn: PropTypes.bool,

    /**
     * callbacks
     */
    onReceived: PropTypes.func,
    onFailToReceived: PropTypes.func,
    onViewWillLeaveApplication: PropTypes.func,
    onViewWillClose: PropTypes.func,
    onViewWillExposure: PropTypes.func,
    onClicked: PropTypes.func,
    onViewWillPresentFullScreenModal: PropTypes.func,
    onViewDidPresentFullScreenModal: PropTypes.func,
    onViewWillDismissFullScreenModal: PropTypes.func,
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
