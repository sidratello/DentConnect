import 'package:flutter/material.dart';

class Static {
  static String ipconfig = "$imageBaseUrl/api/";
static String imageBaseUrl ="https://osnet.shop/dentconnect";
  // static String token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyIiwiZW1haWwiOiJnaGFsaWFoYXplbTIwMDNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiRGVudGlzdCIsImV4cCI6MTc4NzMyNjIzMSwiaXNzIjoiRGVudGFsTGFiLkFwaSIsImF1ZCI6IkRlbnRhbExhYi5BcGkifQ.flPzs8zR4acSOzdfjtXgJVWwp53To8j-Rk5SYGWIdrg";
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
