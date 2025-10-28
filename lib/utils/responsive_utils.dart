import 'package:flutter/material.dart';

enum DeviceScreenType { mobile, tablet, desktop }

class Responsive {
  static DeviceScreenType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return DeviceScreenType.mobile;
    } else if (width >= 600 && width < 1024) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.desktop;
    }
  }}