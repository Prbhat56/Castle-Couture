import 'package:flutter/material.dart';
/*
class ScaleSize {
 static void init({required context}){

 }

 static final GlobalKey<NavigatorState> navigatorMediaQueryKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorMediaQueryKey.currentContext!;





  static height(double heightInPercentage) {
    return MediaQuery.of(context).size.height * (heightInPercentage / 100);
  }

  static width(double widthInPercentage) {
    return MediaQuery.of(context).size.width * (widthInPercentage / 100);
  }

  static EdgeInsets paddingAll(double paddingInPercentage) {
    double padding =
        MediaQuery.of(context).size.width * (paddingInPercentage / 100);
    return EdgeInsets.all(padding);
  }

  static EdgeInsets paddingSymmetric(
      {double horizontal = 0, double vertical = 0}) {
    double horizontalPadding =
        MediaQuery.of(context).size.width * (horizontal / 100);
    double verticalPadding =
        MediaQuery.of(context).size.height * (vertical / 100);
    return EdgeInsets.symmetric(
        horizontal: horizontalPadding, vertical: verticalPadding);
  }
}
*/

//import 'package:flutter/material.dart';

class ScreenSize {
  static late double width;
  static late double height;
  static late double percent;

  static void init({required context}) {
    Size size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}
