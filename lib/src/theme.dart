import 'package:flutter/material.dart';

import './loading_container.dart';
import './animations/animation.dart';
import './animations/opacity_animation.dart';
import './animations/offset_animation.dart';
import './animations/scale_animation.dart';
import 'enums.dart';

class LoadingTheme {
  /// color of indicator
  static Color get indicatorColor =>
      AnotherEasyLoading.instance.loadingStyle == LoadingStyle.custom
          ? AnotherEasyLoading.instance.indicatorColor!
          : AnotherEasyLoading.instance.loadingStyle == LoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// progress color of loading
  static Color get progressColor =>
      AnotherEasyLoading.instance.loadingStyle == LoadingStyle.custom
          ? AnotherEasyLoading.instance.progressColor!
          : AnotherEasyLoading.instance.loadingStyle == LoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// background color of loading
  static Color get backgroundColor =>
      AnotherEasyLoading.instance.loadingStyle == LoadingStyle.custom
          ? AnotherEasyLoading.instance.backgroundColor!
          : AnotherEasyLoading.instance.loadingStyle == LoadingStyle.dark
              ? Colors.black.withOpacity(0.9)
              : Colors.white;

  /// boxShadow color of loading
  static List<BoxShadow>? get boxShadow =>
      AnotherEasyLoading.instance.loadingStyle == LoadingStyle.custom
          ? AnotherEasyLoading.instance.boxShadow ?? [BoxShadow()]
          : null;

  /// font color of status
  static Color get textColor =>
      AnotherEasyLoading.instance.loadingStyle == LoadingStyle.custom
          ? AnotherEasyLoading.instance.textColor!
          : AnotherEasyLoading.instance.loadingStyle == LoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// mask color of loading
  static Color maskColor(LoadingMaskType? maskType) {
    maskType ??= AnotherEasyLoading.instance.maskType;
    return maskType == LoadingMaskType.custom
        ? AnotherEasyLoading.instance.maskColor!
        : maskType == LoadingMaskType.black
            ? Colors.black.withOpacity(0.5)
            : Colors.transparent;
  }

  /// loading animation
  static AnotherEasyLoadingAnimation get loadingAnimation {
    AnotherEasyLoadingAnimation animation;
    switch (AnotherEasyLoading.instance.animationStyle) {
      case LoadingAnimationStyle.custom:
        animation = AnotherEasyLoading.instance.customAnimation!;
        break;
      case LoadingAnimationStyle.offset:
        animation = OffsetAnimation();
        break;
      case LoadingAnimationStyle.scale:
        animation = ScaleAnimation();
        break;
      default:
        animation = OpacityAnimation();
        break;
    }
    return animation;
  }

  /// font size of status
  static double get fontSize => AnotherEasyLoading.instance.fontSize;

  /// size of indicator
  static double get indicatorSize => AnotherEasyLoading.instance.indicatorSize;

  /// width of progress indicator
  static double get progressWidth => AnotherEasyLoading.instance.progressWidth;

  /// width of indicator
  static double get lineWidth => AnotherEasyLoading.instance.lineWidth;

  /// loading indicator type
  static LoadingIndicatorType get indicatorType =>
      AnotherEasyLoading.instance.indicatorType;

  /// toast position
  static LoadingToastPosition get toastPosition =>
      AnotherEasyLoading.instance.toastPosition;

  /// toast position
  static AlignmentGeometry alignment(LoadingToastPosition? position) =>
      position == LoadingToastPosition.bottom
          ? AlignmentDirectional.bottomCenter
          : (position == LoadingToastPosition.top
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.center);

  /// display duration
  static Duration get displayDuration => AnotherEasyLoading.instance.displayDuration;

  /// animation duration
  static Duration get animationDuration =>
      AnotherEasyLoading.instance.animationDuration;

  /// contentPadding of loading
  static EdgeInsets get contentPadding => AnotherEasyLoading.instance.contentPadding;

  /// padding of status
  static EdgeInsets get textPadding => AnotherEasyLoading.instance.textPadding;

  /// textAlign of status
  static TextAlign get textAlign => AnotherEasyLoading.instance.textAlign;

  /// textStyle of status
  static TextStyle? get textStyle => AnotherEasyLoading.instance.textStyle;

  /// radius of loading
  static double get radius => AnotherEasyLoading.instance.radius;

  /// should dismiss on user tap
  static bool? get dismissOnTap => AnotherEasyLoading.instance.dismissOnTap;

  static bool ignoring(LoadingMaskType? maskType) {
    maskType ??= AnotherEasyLoading.instance.maskType;
    return AnotherEasyLoading.instance.userInteractions ??
        (maskType == LoadingMaskType.none ? true : false);
  }
}
