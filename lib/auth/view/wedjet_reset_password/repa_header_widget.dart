import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/app_header.dart';

class ResetPasswordHeaderWidget extends StatelessWidget {
  const ResetPasswordHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 34),
        AuthHeader(
          title: 'إعادة تعيين كلمة المرور',
        onBack: (){
          Get.back();
        },
        ),
      ],
    );
  }
}