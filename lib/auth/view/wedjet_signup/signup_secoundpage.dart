import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:template/auth/controller/signup_controller.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/input_textfield.dart';


class SignupSecondPage extends StatelessWidget {
  const SignupSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
        final controller = Get.find<SignupController>();
    return SingleChildScrollView(
      child: Column(
        children:  [
          AuthInputField(
         hintText: controller.isLab
    ? 'اسم المخبر'
    : 'اسم العيادة',
            prefixIcon: Icon(
              Icons.local_hospital),
           controller: controller.namePlaceController,
           
          ),
          SizedBox(height: 10),

          AuthInputField(
            hintText: 'رقم الهاتف',
            keyboardType: TextInputType.phone,
              prefixIcon: Icon(Icons.phone),
              controller: controller.phoneController,
                   validator: (value) =>
                AppValidators.validateRequired(value, 'رقم الهاتف'),
          
          ),
          SizedBox(height: 10),

if (controller.isLab)
  Obx(
    () => SwitchListTile(
      value: controller.hasScanner.value,
      onChanged: controller.toggleScanner,
      title: const Text('يوجد ماسح ضوئي'),
      activeColor: AppColors.primaryBlue,
    ),
  ),






          
          if (controller.isDentist)
Obx(
  () => InkWell(
    onTap: controller.isPickingFile.value
        ? null
        : controller.pickVerificationDocument,
    child: IgnorePointer(
      child: AuthInputField(
        hintText: controller.verificationDocument.value == null
            ? 'وثيقة الانتساب لنقابة الاطباء'
            : controller.verificationDocument.value!.path.split('/').last,
        prefixIcon: const Icon(Icons.description),
              validator: (_) =>
                      AppValidators.validateVerificationDocument(
                    controller.verificationDocument.value,
                  ),
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}