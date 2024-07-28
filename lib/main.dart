import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moniepoint/moniepoint.dart';
import 'package:moniepoint/utils/logic/app_logic.dart';

void main() {
  registerSingletons();
  runApp(const MoniepointApp());
}

void registerSingletons() {
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  GetIt.I.get<AppLogic>().init();
}

/// Add syntax sugar for quickly accessing the main "logic" controllers in the app
/// We deliberately do not create shortcuts for services, to discourage their use directly in the view/widget layer.
AppLogic get appLogic => GetIt.I.get<AppLogic>();
