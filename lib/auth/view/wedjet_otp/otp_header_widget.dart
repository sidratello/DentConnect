import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:template/core/widgets/app_header.dart';

class OtpHeaderWidget extends StatelessWidget {
  const OtpHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 34),
        AuthHeader(
          title: 'التحقق',
               onBack: (){
          Get.back();
        },
        
        
        ),
      ],
    );
  }
}