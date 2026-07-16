import 'package:flutter/material.dart';
import 'package:template/lab/features/orderconection/views/doctor_orders_wedjet/doctor_orders_body.dart';

import 'package:template/lab/features/orderconection/views/wedjet/lab_background_layout.dart';

class DoctorOrdersScreen extends StatelessWidget {
  const DoctorOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabBackgroundLayout(
     

         
            child: DoctorOrdersBody(),
          
        
      
    );
  }
}