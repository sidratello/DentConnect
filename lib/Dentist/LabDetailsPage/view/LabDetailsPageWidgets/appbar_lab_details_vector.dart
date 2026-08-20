import 'package:flutter/material.dart';

import '../../../../core_dentist/utils/static.dart';

class AppbarLabDetailsVector extends StatelessWidget {
  const AppbarLabDetailsVector({super.key});

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
          'assets/images/vector_back.png',
          width: Static.getwidth(context, 32),
          height: Static.getheight(context, 37.57),
        ),
      ),
    );
  }
}
