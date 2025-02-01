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
    if (width < 600) return ScreenType.mobile;
    if (width < 1200) return ScreenType.tablet;
    return ScreenType.desktop;
  }
}

// Context Extensions
extension ResponsiveContextExtensions on BuildContext {
  ScreenType get screenType {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) return ScreenType.mobile;
    if (width < 1200) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  bool get isMobile => screenType == ScreenType.mobile;
  bool get isTablet => screenType == ScreenType.tablet;
  bool get isDesktop => screenType == ScreenType.desktop;

  double responsiveValue({
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    switch (screenType) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet;
      case ScreenType.desktop:
        return desktop;
    }
  }

  double get responsivePadding => responsiveValue(
    mobile: 16.0,
    tablet: 24.0,
    desktop: 32.0,
  );
}