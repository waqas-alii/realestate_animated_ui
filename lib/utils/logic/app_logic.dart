import 'dart:convert';

import 'package:flutter/material.dart';

import '../keys.dart';

class AppLogic {
  String accessToken = '';

  Future<void> init() async {}

  void clearDataAndRouteToHome(BuildContext context) {
    accessToken = '';
  }
}
