import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils{
  void Toastsmessage(String msg){
    Fluttertoast.showToast(
        msg: msg,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 15,
      gravity: ToastGravity.BOTTOM_LEFT,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}