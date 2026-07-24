import 'package:flutter/material.dart';

class Static {
  // static String ipconfig = "192.168.1.7:7149";
  static String ipconfig = "https://192.168.1.83:3283/api/";
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzIiwiZW1haWwiOiJnaGFsaWFoYXplbTIwMDNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiRGVudGlzdCIsImV4cCI6MTc4NDk4NjQ3MCwiaXNzIjoiRGVudGFsTGFiLkFwaSIsImF1ZCI6IkRlbnRhbExhYi5BcGkifQ.x0uB0DaM0gbj609AVqWO7HslEFPlwHiYmNwNbj-hcxs";

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
