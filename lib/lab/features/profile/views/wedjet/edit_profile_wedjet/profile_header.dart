import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:template/core/widgets/app_header.dart';


class LabProfileTopBar extends StatelessWidget {
  const LabProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),

      child: AuthHeader(

        /// no title

  title: 'تعديل الملف الشخصي',
  onBack: () => Get.back(),
      ),
    );
  }
}