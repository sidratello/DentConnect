import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/signup_controller.dart';
import 'package:template/core/app_validators.dart';

import 'package:template/core/widgets/input_textfield.dart';

class SignupthirdPage extends StatelessWidget {
  const SignupthirdPage({super.key});

  @override
  Widget build(BuildContext context) {
            final controller = Get.find<SignupController>();
    return SingleChildScrollView(
      child: Column(
        children:  [
           AuthInputField(
         hintText: controller.isLab
    ? 'عنوان المخبر'
    : 'عنوان العيادة',
          controller:controller.addressPlaceController,
            validator: (value) =>
      AppValidators.validateRequired(
        value,
        controller.isLab
            ? 'عنوان المخبر'
            : 'عنوان العيادة',
      ),
           prefixIcon: Icon(Icons.location_on),),
          SizedBox(height: 10),

           AuthInputField(
         hintText: controller.isLab
    ? 'مدينة المخبر'
    : 'مدينة العيادة',
          controller:controller.cityPlaceController, 
           prefixIcon: Icon(Icons.location_city),),
          SizedBox(height: 10),

           AuthInputField(
        hintText: controller.isLab
    ? 'بلد المخبر'
    : 'بلد العيادة',
          controller:controller.countryPlaceController,
            prefixIcon: Icon(Icons.public),
          ),

        ],
      ),
    );
  }
}