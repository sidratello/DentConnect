import 'package:flutter/material.dart';

class Static {
  static String ipconfig = "$imageBaseUrl/api/";
static String imageBaseUrl ="https://osnet.shop/dentconnect";
  
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
