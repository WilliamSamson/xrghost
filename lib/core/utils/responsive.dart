import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

class ScreenMetrics {
  static late double width;
  static late double height;
  static late ScreenType screenType;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    screenType = _getScreenType(width);
  }

  static ScreenType _getScreenType(double width) {
    if (width < 450) return ScreenType.mobile;
    if (width < 800) return ScreenType.tablet;
    return ScreenType.desktop;
  }
}

// Responsive Value Calculator
T responsiveValue<T>(BuildContext context, {
  required T mobile,
  T? tablet,
  required T desktop,
}) {
  final screenType = ScreenMetrics.screenType;

  switch (screenType) {
    case ScreenType.mobile:
      return mobile;
    case ScreenType.tablet:
      return tablet ?? desktop;
    case ScreenType.desktop:
      return desktop;
  }
}

// Context Extensions
extension ResponsiveExtensions on BuildContext {
  bool get isMobile => ScreenMetrics.screenType == ScreenType.mobile;
  bool get isTablet => ScreenMetrics.screenType == ScreenType.tablet;
  bool get isDesktop => ScreenMetrics.screenType == ScreenType.desktop;

  double get responsivePadding => responsiveValue(
    this,
    mobile: 16.0,
    tablet: 24.0,
    desktop: 32.0,
  );
}