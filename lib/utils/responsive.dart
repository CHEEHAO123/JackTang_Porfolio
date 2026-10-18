import 'package:flutter/widgets.dart';

/// Breakpoints follow common web conventions (Bootstrap-ish) tuned for a
/// content-first single-page portfolio.
class Breakpoints {
  Breakpoints._();

  static const double mobile = 640;
  static const double tablet = 1000;
  static const double desktop = 1280;
}

enum DeviceType { mobile, tablet, desktop }

class Responsive {
  Responsive._();

  static DeviceType deviceTypeOf(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < Breakpoints.mobile) return DeviceType.mobile;
    if (width < Breakpoints.tablet) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  static bool isMobile(BuildContext context) => deviceTypeOf(context) == DeviceType.mobile;

  static bool isDesktop(BuildContext context) => deviceTypeOf(context) == DeviceType.desktop;

  /// Horizontal page padding that grows with the viewport.
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < Breakpoints.mobile) return 20;
    if (width < Breakpoints.tablet) return 40;
    if (width < Breakpoints.desktop) return 64;
    return (width - Breakpoints.desktop) / 2 + 64;
  }

  /// Max readable content width so text doesn't stretch edge-to-edge on
  /// ultra-wide monitors.
  static const double maxContentWidth = 1152;
}
