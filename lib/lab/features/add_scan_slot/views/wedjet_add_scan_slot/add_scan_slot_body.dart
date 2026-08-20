import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/add_scan_slot/controller/add_scan_slot_controller.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_add_scan_slot/SaveScanSlotButton.dart';
import 'package:template/lab/features/add_scan_slot/views/wedjet_add_scan_slot/add_scan_slot_header.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';

import 'scan_date_field.dart';
import 'scan_period_selector.dart';
import 'scan_time_field.dart';

class AddScanSlotBody extends GetView<AddScanSlotController> {
  const AddScanSlotBody({super.key});

  @override
  Widget build(BuildContext context) {


    return ListView(
      padding: const EdgeInsets.fromLTRB(
        20,
        5,
        20,
        30,
      ),
      children: [
                const AddScanSlotHeader(),

     
        Center(
          child: Image.asset(
            'assets/images/clock.png',
         width: 140,
    height: 140,
            
            fit: BoxFit.contain,
          ),
        ),

      

        Text(
          'إضافة موعد مسح جديد',
          textAlign: TextAlign.center,
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 5),

Text(
  'اختر التاريخ والوقت والفترة لإضافة\nموعد مسح جديد للأطباء المتصلين.',
  textAlign: TextAlign.center,
    maxLines: 2,
  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
    color: AppColors.normalText,
    
    fontSize: 14,
    height: 1.6, // spacing between the two lines
    fontWeight: FontWeight.w500,
  ),
),

        const SizedBox(height: 7),

         
        DetailsSectionCard(
          padding: EdgeInsets.all(11),
          child: Column(
            children: [
              ScanDateField(controller: controller,),

              SizedBox(height: 18),

              ScanTimeField(controller: controller,),

              SizedBox(height: 18),

              ScanPeriodSelector(controller: controller,),

              SizedBox(height: 24),

              SaveScanSlotButton(),
            ],
          ),
        ),
      ],
    );
  }
}
