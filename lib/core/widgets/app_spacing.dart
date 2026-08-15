import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class AppSpacing {
  static Widget height(
    BuildContext context,
    double value,
  ) {
    return SizedBox(
      height: Static.getheight(context, value),
    );
  }

  static Widget width(
    BuildContext context,
    double value,
  ) {
    return SizedBox(
      width: Static.getwidth(context, value),
    );
  }
}
