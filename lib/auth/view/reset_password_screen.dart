import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:template/auth/controller/reset_password_controller.dart';


import 'package:template/auth/view/wedjet_reset_password/repa_action_widget.dart';
import 'package:template/auth/view/wedjet_reset_password/repa_body_widget.dart';
import 'package:template/auth/view/wedjet_reset_password/repa_header_widget.dart';




import 'package:template/core/widgets/auth_layout.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
final controller = Get.find<ResetPasswordController>();

    return  AuthLayout(
  padding: EdgeInsets.only(
    left: 28,
    right: 28,
 bottom: MediaQuery.of(context).viewInsets.bottom + 24,
  ),
  children: [
    Form(
       key: controller.formKey,
      child: Column(
        children: const [
          ResetPasswordHeaderWidget(),
          ResetPasswordBodyWidget(),
          ResetPasswordActionWidget(),
        ],
      ),
    ),
  ],
);}}