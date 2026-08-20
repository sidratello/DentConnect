import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Pages/step_one_page.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Pages/step_two_page.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/DrawerWidgets/app_drawer.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/top_background.dart';
import '../controller/create_order_controller.dart';

class CreateOrderPage extends GetView<CreateOrderController> {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateOrderController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'إنشاء طلب',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
        body: TopBackground(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 24),
              ),
              child: Obx(() {
                if (controller.currentStep.value == 0) {
                  return const StepOnePage();
                } else {
                  return const StepTwoPage();
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
