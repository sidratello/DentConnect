import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_header.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_lab_selector.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_preview_card.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_submit_button.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_text_field.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_type_selector.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../../../core_dentist/theme/app_colors.dart';
import '../../../core_dentist/utils/static.dart';

class ComplaintPageController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RxInt selectedType = 0.obs;

  @override
  void onInit() {
    super.onInit();
    homeController.fetchLabsConnected();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void changeType(int value) {
    selectedType.value = value;
  }

  Future<void> submitComplaint(BuildContext context) async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isEmpty) {
      showError('يرجى إدخال عنوان الشكوى');
      return;
    }
    if (description.isEmpty) {
      showError('يرجى إدخال تفاصيل الشكوى');
      return;
    }
    if (selectedType.value == 1 && homeController.selectedLabId.value == null) {
      showError('يرجى اختيار المخبر أولاً');
      return;
    }

    FocusScope.of(context).unfocus();

    if (selectedType.value == 0) {
      await homeController.sendComplaintAdminRequest(
        title: title,
        description: description,
      );
    } else {
      await homeController.sendComplaintLabRequest(
        homeController.selectedLabId.value!,
        title: title,
        description: description,
      );
    }
  }

  void showError(String message) {
    Get.snackbar(
      'تنبيه',
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      backgroundColor: Colors.redAccent.withValues(alpha: 0.9),
      colorText: Colors.white,
    );
  }
}

class ComplaintPage extends StatelessWidget {
  ComplaintPage({super.key}) {
    if (!Get.isRegistered<ComplaintPageController>()) {
      Get.put(ComplaintPageController());
    }
  }
  ComplaintPageController get controller => Get.find<ComplaintPageController>();

  @override
  Widget build(BuildContext context) {
    final appModeController = Get.find<HomeController>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: const [
            AppbarVectorBlack(),
          ],
          title: Text(
            'تقديم شكوى',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
        body: TopBackground(
          body: SafeArea(
            child: Obx(
              () {
                if (appModeController.isPreviewMode.value) {
                  return const Center(
                    child: ComplaintPreviewCard(),
                  );
                }

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: Static.getwidth(context, 20),
                    vertical: Static.getheight(context, 20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ComplaintHeader(),
                      SizedBox(
                        height: Static.getheight(context, 24),
                      ),
                      ComplaintTypeSelector(
                        selectedType: controller.selectedType.value,
                        onTypeChanged: controller.changeType,
                      ),
                      SizedBox(
                        height: Static.getheight(context, 24),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        child: controller.selectedType.value == 0
                            ? const SizedBox.shrink()
                            : ComplaintLabSelector(
                                homeController: controller.homeController,
                              ),
                      ),
                      if (controller.selectedType.value == 1)
                        SizedBox(
                          height: Static.getheight(context, 20),
                        ),
                      ComplaintTextField(
                        controller: controller.titleController,
                        label: 'عنوان الشكوى',
                        hintText: 'اكتب عنوانًا مختصرًا للشكوى',
                        icon: Icons.title_rounded,
                      ),
                      SizedBox(
                        height: Static.getheight(context, 20),
                      ),
                      ComplaintTextField(
                        controller: controller.descriptionController,
                        label: 'تفاصيل الشكوى',
                        hintText: 'اكتب تفاصيل الشكوى هنا...',
                        icon: Icons.description_outlined,
                        maxLines: 6,
                        minLines: 5,
                        alignLabelWithHint: true,
                      ),
                      SizedBox(
                        height: Static.getheight(context, 30),
                      ),
                      ComplaintSubmitButton(
                        onPressed: () => controller.submitComplaint(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
