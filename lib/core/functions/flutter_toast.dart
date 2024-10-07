import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { sUCCESS, eRROR, wARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.sUCCESS:
      color = Colors.green;
      break;
    case ToastStates.eRROR:
      color = Colors.redAccent;
      break;
    case ToastStates.wARNING:
      color = Colors.deepOrange;
      break;
  }
  return color;
}
