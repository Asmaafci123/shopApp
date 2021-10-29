import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showFlutterToast(
{
  required String msg,
  required toastStates toasts
}
    )=>Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: buildToastColor(toasts),
    textColor: Colors.white,
    fontSize: 16.0
);
enum toastStates{success,error,warning}
Color buildToastColor(toastStates toasts)
{
  switch(toasts)
  {
    case toastStates.success:
      return Colors.green;
      break;
    case toastStates.error:
      return Colors.red;
      break;
    case toastStates.warning:
      return Colors.amber;
      break;
  }
}