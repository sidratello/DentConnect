import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/auth/controller/signup_controller.dart';


import 'package:template/auth/view/wedjet_signup/signup_action.dart';
import 'package:template/auth/view/wedjet_signup/signup_body.dart';

import 'package:template/auth/view/wedjet_signup/signup_header.dart';



import 'package:template/core/widgets/auth_layout.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
final controller = Get.find<SignupController>();

    return Form(
         key: controller.formKey,
      child: AuthLayout(
        children: [
          SignupHeaderWidget(),
          SignupBodyWidget(),
          SignupActionWidget(),
     
                       ],
       ),
    );
        
      
    
  }
}