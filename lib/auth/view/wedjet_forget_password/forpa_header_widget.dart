import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/app_header.dart';

class fpHeaderWidget extends StatelessWidget {
  const fpHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 34),
        AuthHeader(
          title: 'نسيان كلمة المرور',
        onBack: (){
          Get.back();
        },
        ),
      ],
    );
  }
}