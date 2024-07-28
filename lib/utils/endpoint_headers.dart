class WAInterceptorHeaders {
  static String requiresToken = 'requiresToken';
  static String authorization = 'Authorization';
  static String xRequestWith = 'X-Requested-With';
  static String contentType = 'Content-Type';
  static String accept = 'Accept';
}

class ApiEndpoints {
  ///Local baseUrl
  static const String baseUrl = 'http://localhost:3000';

  ///AWS Lightsail url
  //static const String baseUrl = 'http://13.125.121.209:5000';

  static const String loginEndpoint = '/auth/login';
  static const String columnNamesEndpoint = '/items/get-items';
  static const String inventoryStatusOrdersEndpoint = '/warehouse/get-stocks';
  static const String inspectionRegistrationEndpoint =
      '/inspection/get-inspection-reg-orders';
  static const String getDefectiveNamesEndPoint =
      '/inspection/get-defective-names';

  static const String prodStatusHeaderEndpoint =
      '/production/get-prod-status-header';
  static const String releaseDefRegHeaderEndpoint =
      '/production/get-release-def-reg-header-data';
  static const String goodProdRegHeaderEndpoint =
      '/production/get-good-prod-reg-header-data';
  static const String prodStatusDetailEndpoint =
      '/production/get-prod-status-detail';
  static const String goodProdRegDetailEndpoint =
      '/production/get-good-prod-reg-detail-data';
  static const String goodProdRegSubDetailEndpoint =
      '/production/get-good-prod-reg-sub-detail-data';

  static const String getLossCodes = '/production/get-loss-codes';
  static const String getStopCodes = '/production/get-stop-codes';
  static const String prodStatusSubDetailEndpoint =
      '/production/get-prod-status-sub-detail';
  static const String inspectionRegistrationDetailEndpoint =
      '/inspection/get-inspection-reg-order-detail';
  static const String purchaseOrdersEndpoint = '/purchase/get-purchase-orders';
  static const String weightRegOrdersEndpoint =
      '/purchase/get-weight-reg-orders';
  static const String chooseStockOrdersEndpoint =
      '/warehouse/get-choose-stock-orders';
  static const String releaseRegOrdersEndpoint =
      '/warehouse/get-release-reg-orders';
  static const String processInspectionOrdersEndpoint =
      '/inspection/get-process-inspection-orders';
  static const String processInsListEndpoint =
      '/inspection/get-process-ins-list-orders';
  static const String processInsListDetailButtonEndpoint =
      '/inspection/get-process-ins-list-detail-button-orders';
  static const String finalInspectionOrdersEndpoint =
      '/inspection/get-final-inspection';

  static const String confirmInspectionFinalRegEndpoint =
      '/inspection/update-confirm-inspection-final-reg';

  static const String saveMemoEndpoint = '/inspection/save-memo';
  static const String cancelInsProcessRegEndpoint =
      '/inspection/cancel-inspection-process-reg';

  static const String finalInsRegEndpoint =
      '/inspection/get-final-inspection-reg-header';
  static const String saveInspectionEndpoint = '/inspection/save-inspection';
  static const String confirmInspectionProcessRegEndpoint =
      '/inspection/confirm-inspection-process-reg';
  static const String finalInspectionListOrdersEndpoint =
      '/inspection/get-final-inspection-list';
  static const String releasedListOrdersEndpoint =
      '/warehouse/get-released-list-orders';
  static const String purchaseOrderDetailEndpoint =
      '/purchase/get-purchase-order-detail';
  static const String deleteWeightRegEndpoint =
      '/purchase/delete-weight-reg-order';
  static const String saveWeightRegEndpoint = '/purchase/save-weight-reg';
  static const String stocktakingOrdersEndpoint =
      '/warehouse/get-stock-taking-list';
  static const String stocktakingOrderDetailEndpoint =
      '/warehouse/get-stock-taking-detail';

  static const String cancelWarehouseReleaseListEndpoint =
      '/warehouse/cancel-warehouse-release-list';
  static const String saveTempReleaseRegEndpoint =
      '/warehouse/save-temp-release-reg';

  static const String saveStocktakingEndpoint = '/warehouse/save-stock-taking';
  static const String saveMoveEndpoint = '/warehouse/save-move-stock';
  static const String warehouseReleaseEndpoint =
      '/warehouse/warehouse-release-save';
  static const String inventoryMoveOrdersEndpoint =
      '/warehouse/get-move-stocks-list';
  static const String inventoryStatusOrderDetailEndpoint =
      '/warehouse/get-stock-detail';

  static const String warehouseDataEndpoint = '/warehouse/get-warehouse-list';
  static const String inspectorCodesEndpoint =
      '/inspection/get-inspection-codes';
  static const String workerCodesEndpoint = '/production/get-worker-codes';
  static const String startWorkEndpoint = '/production/update-start-work';
  static const String saveEquipmentEndpoint = '/production/save-equipment-reg';
  static const String endWorkEndpoint = '/production/update-end-work';
  static const String cancelWorkEndpoint = '/production/update-cancel-work';
  static const String saveDefRegEndpoint =
      '/production/save-defective-registration';
  static const String cancelProductionEndpoint =
      '/production/cancel-production';
  static const String confirmGoodProductRegEndpoint =
      '/production/confirm-good-product-reg';
  static const String saveReleaseDefectiveRegEndpoint =
      '/production/save-release-defective-registration';
  static const String getOrderNumbersDataEndpoint =
      '/purchase/get-order-numbers';
  static const String lotNoDataEndpoint = '/warehouse/get-lots';
  static const String getReleaseUsersDataEndpoint =
      '/warehouse/get-release-users';

  static const String getProductTypesEndPoint = '/items/product-types';
  static const String getMenusEndPoint = '/menus/get-menus';
  static const String verifyCodeEndpoint = '/auth/confirmCode';
  static const String verifyForgotPasswordCodeEndpoint =
      '/auth/validateForgotPasswordOTP';
  static const String forgotPasswordEndpoint = '/auth/forgot-password';
  static const String updatePasswordEndpoint = '/auth/updatePassword';
  static const String logoutEndpoint = '/auth/logout';
  static const String resendVerifyCodeEndpoint = '/auth/resendActivationCode';
}
