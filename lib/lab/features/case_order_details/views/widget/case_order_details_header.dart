import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:template/core/widgets/app_page_header_cases.dart';
import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';

class CaseOrdersdetalsHeader
    extends GetView<CaseOrderDetailsController> {


  const CaseOrdersdetalsHeader({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
   
    return AppPageHeader(
  title: 'تفاصيل الطلب',
  subtitle:"جميع معلومات الطلب وتفاصيله في مكان واحد",
  imagePath: 'assets/images/tooth.png',
onBack: controller.goBack,
    );
  }
}