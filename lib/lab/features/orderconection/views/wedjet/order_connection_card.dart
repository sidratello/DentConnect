import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';

import 'package:template/lab/features/orderconection/model/order_conection_model.dart';

import 'package:template/lab/features/orderconection/views/wedjet/doctoricon.dart';
import 'package:template/lab/features/orderconection/views/wedjet/order_connection_details_dialog.dart';



class OrderConnectionCard extends StatelessWidget {
  final OrderConnectionModel item;

final VoidCallback onAccept;
final VoidCallback onReject;
const OrderConnectionCard({
  super.key,
  required this.item,
  required this.onAccept,
  required this.onReject,
});

  @override
  Widget build(BuildContext context) {
    final initial = AppHelper.getDoctorInitial(item.dentist.name);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(14.w),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(22.r),
                    // color: const Color.fromARGB(255, 224, 230, 243),
  image: const DecorationImage(
    image: AssetImage('assets/images/photo_2026-05-21_10-26-13.jpg'),
    fit: BoxFit.cover,
    opacity: 0.4,
  ),



  border: Border.all(
    color: AppColors.white,
    width: 1.5,
  ),

  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(.08),
      blurRadius: 34.r,
      offset: Offset(0, 6.h),
    ),
  ],
),
  
  
        child: Column(
          children: [
            Row(
              children: [
           DoctorInitialIcon(
  initial: initial,
  imageUrl: item.dentist.profilePictureUrl,
),

                SizedBox(width: 14.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.dentist.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
  color: AppColors.darkBlue,
)
                      ),
                       Text(
                        item.dentist.namePlace,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
  color: AppColors.darkBlue,
  fontSize: 14.sp,
)
                      ),
                      SizedBox(height: 6.h),
                      Text(
                       '${item.dentist.countryPlace} - ${item.dentist.cityPlace} - ${item.dentist.addressPlace}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
  color: AppColors.black54,
)
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10.w),

                Column(
                  children: [
AppButton(
  title: 'رفض',
  onTap: onReject,
  width: 95.w,
  height: 38.h,
  borderRadius: 16.r,
  backgroundColor: const Color.fromARGB(203, 243, 245, 250),
  textColor: const Color(0xFF6B7280),
  textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
    color: const Color(0xFF6B7280),
    fontWeight: FontWeight.w700,
    fontSize: 13.sp,
  ),
),
                    SizedBox(height: 10.h),
                   AppButton(
  title: 'قبول ',
  onTap: onAccept,
  width: 95.w,
  height: 38.h,
  borderRadius: 16.r,
  backgroundColor: Color(0xff0A2F8F),
  textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 13.sp,
  ),
)
                  ],
                ),
              ],
            ),

            SizedBox(height: 14.h),

            SizedBox(
              height: 44.h,
              width: double.infinity,
              child:
              
  AppButton(
  title: 'عرض التفاصيل',
  type: AppButtonType.outlined,
  backgroundColor: const Color.fromARGB(255, 214, 227, 250),
  borderColor: const Color(0xFFC3D5FF),
  textColor: AppColors.darkBlue,
  icon: Icon(
    Icons.remove_red_eye_outlined,
    color: AppColors.darkBlue,
    size: 20.sp,
  ),
  onTap: () {
    showOrderConnectionDetailsDialog(
      context,
      item,
      onAccept,
      onReject,
    );
  },
)
            ),
          ],
        ),
    
    );
  }
}