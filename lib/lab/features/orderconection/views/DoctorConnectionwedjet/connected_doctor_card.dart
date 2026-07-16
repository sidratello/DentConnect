import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/orderconection/views/wedjet/doctor_details_dialog.dart';

import '../../model/connected_doctor_model.dart';
import '../../../orderconection/views/wedjet/doctoricon.dart';



class ConnectedDoctorCard extends StatelessWidget {
  final ConnectedDoctorModel doctor;
  final VoidCallback onDisconnect;

  const ConnectedDoctorCard({
    super.key,
    required this.doctor,
    required this.onDisconnect,
  });

  @override
  Widget build(BuildContext context) {
    final initial = AppHelper.getDoctorInitial(doctor.name);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22.r),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/photo_2026-05-21_10-26-13.jpg',
          ),
          fit: BoxFit.cover,
          opacity: .30,
        ),
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(.55),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue.withOpacity(.08),
            blurRadius: 24.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  DoctorInitialIcon(
                    initial: initial,
                      showSmallInitial: false,
                  ),
                  Positioned(
                    right: 3.w,
                    bottom: 8.h,
                    child: Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF12B76A),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style:
                          AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Text(
                      doctor.clinicName.isEmpty
                          ? 'عيادة أسنان'
                          : doctor.clinicName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style:
                          AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                        color: AppColors.normalText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 5.h),
   _DoctorInformationRow(
        
            value: doctor.fullAddress,
          ),
             
                  ],
                ),
              ),

              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: AppColors.darkBlue,
                ),
onSelected: (value) {
  if (value == 'details') {
    showDoctorDetailsDialog(
      context: context,
      doctorName: doctor.name,
      clinicName: doctor.clinicName,
      address: doctor.fullAddress,
      phone: doctor.phone,
      email: doctor.email,
      description:
          '  هذا الطبيب متصل مع المخبر ويمكنه  رؤية الطلبات الخاصة به.',
      showConnectedIndicator: true,
      primaryAction: DoctorDialogAction(
        title: 'عرض طلبات الطبيب',
        backgroundColor: const Color(0xff0A2F8F),
        icon: Icons.assignment_outlined,
        onTap: () {
        Get.toNamed(
      AppRouter.doctorOrders,
      arguments: {
        'doctorId': doctor.id,
        'doctorName': doctor.name,
      },
    );
        },
      ),
      secondaryAction: DoctorDialogAction(
        title: 'قطع الاتصال',
        backgroundColor: const Color(0xFFF3F5FA),
        textColor: AppColors.red,
        icon: Icons.link_off_rounded,
        onTap: onDisconnect,
      ),
    );
  }

  if (value == 'disconnect') {
    onDisconnect();
  }
},
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: 'details',
                    child: Text('عرض التفاصيل'),
                  ),
                  PopupMenuItem(
                    value: 'disconnect',
                    child: Text('قطع الاتصال'),
                  ),
                ],
              ),
            ],
          ),

       


        

       

       

          SizedBox(height: 26.h),

     Row(
  textDirection: TextDirection.rtl,
  children: [
    Expanded(
      child: AppButton(
        title: 'عرض التفاصيل',
        type: AppButtonType.outlined,
        height: 46.h,
        borderRadius: 12.r,
       backgroundColor: const Color.fromARGB(255, 214, 227, 250),
  borderColor: const Color(0xFFC3D5FF),
  textColor: AppColors.darkBlue,
  icon: Icon(
    Icons.remove_red_eye_outlined,
    color: AppColors.darkBlue,
    size: 20.sp,
  ),
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
          color:  AppColors.darkBlue,
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
        ),

   onTap: () {
  showDoctorDetailsDialog(
    context: context,
    doctorName: doctor.name,
    clinicName: doctor.clinicName,
    address: doctor.fullAddress,
    phone: doctor.phone,
    email: doctor.email,
    description:
        '  هذا الطبيب متصل مع المخبر ويمكنه  رؤية الطلبات الخاصة به.',
    showConnectedIndicator: true,
    primaryAction: DoctorDialogAction(
      title: 'عرض طلبات الطبيب',
      backgroundColor: const Color(0xff0A2F8F),
      icon: Icons.assignment_outlined,
      onTap: () {
       Get.toNamed(
      AppRouter.doctorOrders,
      arguments: {
        'doctorId': doctor.id,
        'doctorName': doctor.name,
      },
    );
      },
    ),
    secondaryAction: DoctorDialogAction(
      title: 'قطع الاتصال',
      backgroundColor: const Color(0xFFF3F5FA),
      textColor: AppColors.red,
      icon: Icons.link_off_rounded,
      onTap: onDisconnect,
    ),
  );
},
      ),
    ),

    SizedBox(width: 8.w),

    Expanded(
      child: AppButton(
        title: 'قطع الاتصال',
        type: AppButtonType.outlined,
        height: 46.h,
        borderRadius: 12.r,
        backgroundColor: const Color.fromARGB(157, 255, 255, 255),
        borderColor: AppColors.red.withOpacity(.55),
        textColor: AppColors.red,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
          color: AppColors.red,
          fontWeight: FontWeight.w700,
          fontSize: 11.sp,
        ),
        icon: Icon(
          Icons.link_off_rounded,
          color: AppColors.red,
          size: 17.sp,
        ),
        onTap: onDisconnect,
      ),
    ),
  ],
),
        ],
      ),
    );
  }
}

class _DoctorInformationRow extends StatelessWidget {

  final String value;

  const _DoctorInformationRow({

    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return 
    
      Row(
        textDirection: TextDirection.rtl,
        children: [
   
        
          Expanded(
            child: Text(
              value.trim().isEmpty ? '-' : value,
            
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      
    );
  }
}