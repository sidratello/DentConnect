import 'package:flutter/material.dart';
import 'package:template/core/widgets/app_page_header_cases.dart';


class UpdateOrderStatusHeader extends StatelessWidget {
  const UpdateOrderStatusHeader({super.key});




  @override
  Widget build(BuildContext context) {
    return AppPageHeader(
  title: 'تحديث حالة الطلب',
  subtitle:"تابع مراحل تنفيذ الطلب وقم بتحديث حالته",
  imagePath: 'assets/images/tooth.png',

    );
  }
}