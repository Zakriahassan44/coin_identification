import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: const Color(0xffFF7E5F),
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
  );
}
