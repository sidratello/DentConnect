import 'package:flutter/material.dart';


import 'package:template/auth/view/wedjet_otp/otp_action_widget.dart';
import 'package:template/auth/view/wedjet_otp/otp_body_widget.dart';
import 'package:template/auth/view/wedjet_otp/otp_header_widget.dart';


import 'package:template/core/widgets/auth_layout.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
  

    return AuthLayout(
  padding: EdgeInsets.only(
    left: 28,
    right: 28,
    bottom: MediaQuery.of(context).size.height * 0.60,
  ),
  children: [
          OtpHeaderWidget(),
        OtpBodyWidget(),
        OtpActionWidget(),

   
                        
                        ],);
                      
                    
                  
      
      
    
  }
}