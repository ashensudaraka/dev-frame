import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomColors {
  static const Color appBarColor = const Color(0xFFb515F83);
  static const Color backgroundColor = const Color(0xFFF2F2F2);
  static const Color formBackgroundColor = const Color(0xFFFFFFFF);
  static const Color textColor = const Color(0xFF84898D);
  static const Color textColorBlue = const Color(0xFF0062A9);
  static const Color textColorGreen = const Color(0xFF00AB66);
  static const Color textColorWhite = const Color(0xFFFFFFFF);
  static const Color textColorGrey = const Color(0xFF707070);
  static const Color headingTextColor = const Color(0xFF0062A9);
  static const Color errorTextColor = const Color(0xFFFF0000);
  static const Color textFieldFillColor = const Color(0xFFFFFFFF);
  static const Color dividerColor = const Color(0xFFB2B0B0);
  static const Color buttonColor = const Color(0xFF0062A9);
  static const Color buttonTextColor = const Color(0xFFFFFFFF);
  static const Color sideBarUserName = const Color(0xFFF73A7CC);
  static const Color sideBarUserJobTitle = const Color(0xFFFFCEC663);
  static const Color sideBarbackgroundColor1 = const Color(0xFFFF3B477C);
  static const Color sideBarbackgroundColor2 = const Color(0xFFFF394477);
  static const Color sideBarbackgroundColor3 = const Color(0xFFFF98A0C7);
  static const Color sideBarbackgroundColor4 = const Color(0xFFFF555F90);
  static const Color sideBarbackgroundColor5 = const Color(0xFFFFA9B1D5);
}

//Getting screen size & determine mobile screen or tab screen => Output values: true or false
isMobileLayout(BuildContext context) {
  bool useMobileLayout;
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  useMobileLayout = shortestSide < 600;
  return useMobileLayout;
}

getTextSize(useMobileLayout) {
  var textSize = useMobileLayout == true ? 16.0 : 20.0;
  return textSize;
}

getTextSizeSmall(useMobileLayout) {
  var textSize = useMobileLayout == true ? 14.0 : 20.0;
  return textSize;
}

getTextSizeLarge(useMobileLayout) {
  var headerTextSize = useMobileLayout == true ? 18.0 : 25.0;
  return headerTextSize;
}

getTextSizeExtraLarge(useMobileLayout) {
  var textSize = useMobileLayout == true ? 21.0 : 31.0;
  return textSize;
}

getAppBarTextSize(useMobileLayout) {
  var textSize = useMobileLayout == true ? 20.0 : 25.0;
  return textSize;
}

getContainerPadding(useMobileLayout) {
  var containerPadding = useMobileLayout == true ? 10.0 : 25.0;
  return containerPadding;
}

getDateFormat(date) {
  var formattedDate = DateFormat('yyyy/MM/dd').format(date);
  return formattedDate;
}

getListTilePadding(context) {
  var paddingTopBottom, paddingLeftRight;
  if (isMobileLayout(context) == true) {
    paddingTopBottom = 0.0;
    paddingLeftRight = 10.0;
  } else {
    paddingTopBottom = 10.0;
    paddingLeftRight = 35.0;
  }
  return EdgeInsets.fromLTRB(
    paddingLeftRight,
    paddingTopBottom,
    paddingLeftRight,
    paddingTopBottom,
  );
}

getFloatingButtonSize(useMobileLayout) {
  var size = useMobileLayout == true ? 55.0 : 100.0;
  return size;
}

getFloatingButtonIconSize(useMobileLayout) {
  var size = useMobileLayout == true ? 25.0 : 30.0;
  return size;
}
