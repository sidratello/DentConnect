import 'package:flutter/material.dart';

class Static {
  // static String ipconfig = "192.168.1.7:7149";
  static String ipconfig = "http://10.229.153.26:3284/api/";
  static String token = "";

  static double getheight(BuildContext context, double size) {
    return (MediaQuery.of(context).size.height / 932) * size;
  }

  static double getwidth(BuildContext context, double size) {
    return (MediaQuery.of(context).size.width / 430) * size;
  }

  static void showCustomSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
