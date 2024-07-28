import 'package:flutter/material.dart';

import 'themes.dart';

const blackTextColor = Color(0xFF1F2C34);
const kLightMainColor = Color(0xFFDDB1D7);
const kGradientColor = Color(0xFFECE6FF);
const kPrimaryColor = Color(0xFFFC9E11);
const kSecondaryColor = Color(0xFFA5957E);
const kSliderColor = Color(0xFFD6C4B5);
const lightBlack = Color(0xFF2B2B2B);
const darkBlack = Color(0xFF22211F);
const iconBgColor = Color(0xFF737373);


const sfowIconColor = Color(0xFF05057A);
const tableHeaderColor = Color(0xFF0B3861);
const textFieldFocusedColor = Color(0xFF015FCC);
const rowBgColor = Color(0xFFD9D9D9);
const orangeCellColor = Color(0xFFFF7F50);
const gridLinesColor = Color(0xFFEFEFEF);
const customTFBorderColor = Color.fromRGBO(190, 190, 190, 1);

const tagColor = Color(0xFFDEF7EC);
const tagTextColor = Color(0xFF059669);
const scamBoxColor = Color(0xFFFDFDEA);
const verificationAlert = Color(0xFFFDE8E8);
const alertIconColor = Colors.amber;
const scamTextColor = Color(0xFF8E6343);
const thumbnailColor = Color(0xFFF2F4F9);
const priceColor = Color(0xFFE2E8F0);
const kNeutralColor = Color(0xFF747474);
const warehouseColor = Color(0xFFE6F2FF);
const kSubTitleColor = Color(0xFF4F5350);
const kLightNeutralColor = Color(0xFF8E8E8E);
const darkTextColor = Color(0xFF383838);
const kUnselectedColor = Color(0xFF96ACCC);
const kDarkWhite = Color(0xFFF6F6F6);
const kWhite = Color(0xFFFFFFFF);
const purpleLight = Color(0xFFFFEFFD);
const iconColor = Color(0xFF9CA3AF);
const starColor = Color(0xFFD0D0D0);
const placeholderBackgroundColor = Color(0xFFE4E4E4);
const kBorderColorTextField = Color(0xFFE3E3E3);
const sumCardColor = Color(0xFFE2E8F0);
const ratingBarColor = Color(0xFFFFB33E);
const pendingColor = Color(0xFFDB7F24);
const projectAlertBackgroundColor = Color(0xFFFEECDC);
const projectAlertTextColor = Color(0xFFB43404);
const iconTextColor = Color(0xFF64748B);
const buyerMilestoneBackColor = Color(0xFFF1F5F9);
const buyerMilestoneIconColor = Color(0xFF94A3B8);

const kTextStyle =
    TextStyle(color: kNeutralColor, fontFamily: FontFamilies.quicksand);

const kButtonDecoration = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.all(
    Radius.circular(40.0),
  ),
);

InputDecoration kInputDecoration = const InputDecoration(
  hintStyle: TextStyle(color: kSubTitleColor),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6.0),
    ),
    borderSide: BorderSide(color: kPrimaryColor, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: kBorderColorTextField,
    ),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

var linearGradient = const LinearGradient(
  colors: [Colors.white, kGradientColor],
  begin: Alignment.center,
  end: Alignment.bottomCenter,
);

var gridDecoration = const BoxDecoration(
    border: Border(
        right: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
        top: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
        bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26)),
        left: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.26))));

const String findMemberInfoUrl =
    'https://cloudjoin.ecohytech.net/cloudRegister/findInfo.jsp';
const String customerSupportUrl = 'https://www.ecohytech.co.kr/';
