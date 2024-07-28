import 'package:flutter/material.dart';

class ViewDimension {
  final double _deviceHeight;
  final double _deviceWidth;
  final EdgeInsets _safeArea;

  ViewDimension._internal(
      this._deviceHeight, this._deviceWidth, this._safeArea);

  static ViewDimension init(context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final double deviceHeight = mediaQuery.size.height;
    final double deviceWidth = mediaQuery.size.width;
    final EdgeInsets safeArea = mediaQuery.padding;
    return ViewDimension._internal(deviceHeight, deviceWidth, safeArea);
  }

  double height(double size) => _deviceHeight * size;

  double width(double size) => _deviceWidth * size;

  EdgeInsets get safeArea => _safeArea;
}
