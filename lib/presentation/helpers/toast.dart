import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

customShowToast(String message) {
  int mTime = (message.length / 3).round();
  mTime = mTime < 0 ? 1 : mTime;

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: mTime,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}
