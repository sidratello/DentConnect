import 'package:flutter/material.dart';
import 'package:template/core_dentist/utils/static.dart';

class AppbarVectorBlack extends StatelessWidget {
  const AppbarVectorBlack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Static.getwidth(context, 24),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/images/vector_back_black.png',
          width: Static.getwidth(context, 32),
          height: Static.getheight(context, 37.57),
        ),
      ),
    );
  }
}
