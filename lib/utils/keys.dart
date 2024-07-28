import 'package:flutter/cupertino.dart';

class AppKeys {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  static BuildContext? get context => navigatorKey.currentContext;

  static const String user = 'user';
  static const String currentLocale = 'currentLocale';
  static const String accessToken = 'accessToken';
}

class AppMenuCodes {
  static const String releasedList = 'M000001550';
  static const String releaseRegistration = 'M000001549';
  static const String processInspection = 'M000001186';
  static const String processInspectionList = 'M000001467';
  static const String finalInsListDetailModal = 'M000001593';
  static const String finalInspection = 'M000001583';
  static const String finalInspectionList = 'M000001592';
  static const String finalInspectionRegistration = 'M000001584';
  static const String inspectionRegistration = 'M000001440';
  static const String productionStatus = 'M000001456';
  static const String analysisItemCode = 'M000001594';
  static const String makeItemCode = 'M000001595';
  static const String releaseDefectiveReg = 'M000001533';
  static const String defectiveReg = 'M000001557';
  static const String salesOrderStatus = 'M000001611';
  static const String goodProductReg = 'M000001556';
  static const String moveStock = 'M000000325';
  static const String status = 'M000000326';
  static const String stocktaking = 'M000001428';
  static const String lotMaking = 'M000001523';
  static const String weightRegistration = 'M000001586';
  static const String chooseStock = 'M000001551';
}
