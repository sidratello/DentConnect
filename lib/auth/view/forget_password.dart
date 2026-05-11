import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/auth/controller/forpa_controller.dart';
import 'package:template/auth/view/wedjet_forget_password/forpa_action_widget.dart';
import 'package:template/auth/view/wedjet_forget_password/forpa_body_widget.dart';
import 'package:template/auth/view/wedjet_forget_password/forpa_header_widget.dart';




import 'package:template/core/widgets/auth_layout.dart';

class fpScreen extends StatelessWidget {
  const fpScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = Get.find<ForgetPasswordController>();

    return AuthLayout(
  padding: EdgeInsets.only(
    left: 28,
    right: 28,
    bottom: MediaQuery.of(context).size.height * 0.47,
  ),
  children: [
    Form(
            key: controller.formKey,
      child: Column(
        children: const [
            fpHeaderWidget(),
          fpBodyWidget(),
          fpActionWidget(),
      
         
                         ],
      ),
    ),
  ],
);
                    
                  
      
      
    
  }
}