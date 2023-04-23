import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  const ResponsiveLayout(
      {super.key, required this.mobile, this.tablet, required this.desktop});

  static isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 896;
  static isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1280 &&
      MediaQuery.of(context).size.width >= 896;
  static isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1280) {
      return desktop;
    } else if (size.width >= 896 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
