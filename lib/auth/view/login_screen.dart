import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:template/auth/controller/login_controller.dart';

import 'package:template/auth/view/wedjet_login/login_action_widget.dart';
import 'package:template/auth/view/wedjet_login/login_body_widget.dart';
import 'package:template/auth/view/wedjet_login/login_header_widget.dart';

import 'package:template/core/widgets/auth_layout.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<LoginController>();

    return  Form(
        key: controller.formKey,
      child: AuthLayout(
        bottomImageHeight: 0.22,
        padding: EdgeInsets.only(
      left: 28,
      right: 28,
      bottom: MediaQuery.of(context).size.height * 0.18,
        ),
        children: [
         LoginHeaderWidget(),
            LoginBodyWidget(),
            LoginActionWidget(), 
                      ],),
    );
                  

  
    
  }
}