import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveExtension on ResponsiveBreakpointsData {
  double get sidePadding {
    if (isMobile) {
      return 20;
    } else if (isTablet) {
      return 50;
    } else {
      return (screenWidth - breakpoint.start + 100) / 2;
    }
  }
}
