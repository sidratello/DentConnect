


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/order/controller/order_details_controller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/custom_action_dialog.dart';

class OrderDetailsActionsWidget extends StatelessWidget {
  const OrderDetailsActionsWidget({super.key});

  void _showRejectDialog(
    BuildContext context,
    OrderDetailsController controller,
  ) {
    final reasonController = TextEditingController();

CustomActionDialog.show(
      context: context,
      title: 'سبب رفض الطلب',
      content: TextField(
        controller: reasonController,
        maxLines: 4,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'اكتب سبب الرفض',
          border: OutlineInputBorder(),
        ),
      ),
      confirmButton: Obx(
        () => AppButton(
          title: 'رفض',
          onTap: () {
            controller.rejectOrder(reasonController.text);
          },
          width: 95.w,
          height: 52.h,
          borderRadius: 16.r,
       backgroundColor:  AppColors.lightActionGrey,
          isLoading: controller.isRejectLoading.value,
          textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
void _showRequestInfoDialog(
  BuildContext context,
  OrderDetailsController controller,
) {
  final messageController = TextEditingController();

   CustomActionDialog.show(
      context: context,
      title: 'طلب معلومات إضافية',
      content: TextField(
        controller: messageController,
        maxLines: 4,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'قم بكتابة ما تريد طلبه من معلومات إضافية',
          border: OutlineInputBorder(),
        ),
      ),
      confirmButton: Obx(
        () => AppButton(
          title: 'إرسال',
          onTap: () {
            controller.requestMoreInfo(messageController.text);
          },
          width: 95.w,
          height: 38.h,
          borderRadius: 16.r,
          backgroundColor:  AppColors.lightActionGrey,
          isLoading: controller.isRequestInfoLoading.value,
          textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderDetailsController>();

    return Padding(
      padding: EdgeInsets.fromLTRB(13.w, 8.h, 13.w, 16.h),
      child:  Row(
  children: [
  
      Expanded(
        child: AppButton(
  type: AppButtonType.customDecoration,
  decoration: AppHelper.rejectButtonDecoration(20.r),
  title: 'رفض الطلب',
  onTap: () {
    _showRejectDialog(context, controller);
  },
)
      ),
    

    SizedBox(width: 8.w),

   
      Expanded(
        child: AppButton(
  type: AppButtonType.customDecoration,
  decoration: AppHelper.requestButtonDecoration(20.r),
  title: 'طلب معلومات إضافية',
  onTap: () {
    _showRequestInfoDialog(context, controller);
  },
  height: 58,
)
      ),


    SizedBox(width: 8.w),

  
      Expanded(
        child:Obx(
          () => AppButton(
            type: AppButtonType.customDecoration,
            decoration: AppHelper.acceptButtonDecoration(20.r),
            title: 'قبول الطلب',
            onTap: controller.acceptOrder,
                 
              isLoading: controller.isAcceptLoading.value,
          ),
        )
      ),
    
  ],
),
      
    );
  }
}