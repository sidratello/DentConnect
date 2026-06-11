import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/orderconection/model/order_conection_model.dart';
import 'package:template/lab/features/orderconection/views/wedjet/doctoricon.dart';

void showOrderConnectionDetailsDialog(
  BuildContext context,
  OrderConnectionModel item,
  VoidCallback onAccept,
  VoidCallback onReject,
) {
  final initial = AppHelper.getDoctorInitial(item.dentist.name);

  showDialog(
    context: context,
  
    builder: (_) {
      return 
        Dialog(
      
          insetPadding: EdgeInsets.symmetric(horizontal: 28.w,),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/photo_2026-05-21_10-26-13.jpg'),
                fit: BoxFit.cover,
                opacity: .75,
              ),
              border: Border.all(color: AppColors.white, width: 3.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 150.h),

                Container(
                  padding: EdgeInsets.all(22.w),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 230, 243),
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                                DoctorInitialIcon(initial: initial),
                          Expanded(
                            child: Text(
                              item.dentist.name,
                         
                              style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                                color: AppColors.darkBlue,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                    
                        ],
                      ),
  Row(
                        children: [
                          Icon(Icons.medical_services_outlined, size: 24.sp),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              item.dentist.namePlace,
                          
                              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 24.sp),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                            '${item.dentist.countryPlace} - ${item.dentist.cityPlace} - ${item.dentist.addressPlace}',
                              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          Icon(Icons.phone_android, size: 24.sp),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              item.dentist.phone,
                          
                              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                                fontSize: 18.sp,
                                color: AppColors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),

       Divider(
  color: Colors.white,
  thickness: 1,
),

                      Text(
                        'يرغب بالاتصال معك من اجل طلب  \n           الطلبات ومتابعتها',
                    
                        style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                          color: AppColors.black54,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              title: 'قبول',
                              onTap: () {
                                Get.back();
                                onAccept();
                              },
                              height: 54.h,
                              borderRadius: 24.r,
                              backgroundColor: const Color.fromARGB(255, 4, 0, 84)
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: AppButton(
                              title: 'رفض',
                              onTap: () {
                                Get.back();
                                onReject();
                              },
                              height: 54.h,
                              borderRadius: 24.r,
                              backgroundColor:Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    
      );
    },
  );
}