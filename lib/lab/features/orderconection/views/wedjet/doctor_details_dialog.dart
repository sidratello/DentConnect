import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/lab/features/orderconection/views/wedjet/doctoricon.dart';

class DoctorDialogAction {
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  const DoctorDialogAction({
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    this.textColor = AppColors.white,
    this.icon,
  });
}

void showDoctorDetailsDialog({
  required BuildContext context,
  required String doctorName,
  required String clinicName,
  required String address,
  required String phone,
  String? email,
  required String description,
  required DoctorDialogAction primaryAction,
  required DoctorDialogAction secondaryAction,
  bool showConnectedIndicator = false,
  String profilePictureUrl = '',
}) {
  final initial = AppHelper.getDoctorInitial(doctorName);

  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.r),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/photo_2026-05-21_10-26-13.jpg',
              ),
              fit: BoxFit.cover,
              opacity: .75,
            ),
            border: Border.all(
              color: AppColors.white,
              width: 3.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 150.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(22.w),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 230, 243),
                  borderRadius: BorderRadius.circular(26.r),
                ),
                child: Column(
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            DoctorInitialIcon(
                              initial: initial,
                                imageUrl: profilePictureUrl,
                              showSmallInitial: !showConnectedIndicator,
                            ),

                            if (showConnectedIndicator)
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
                          child: Text(
                            doctorName,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                              color: AppColors.darkBlue,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 14.h),

                    _DoctorDialogInfoRow(
                      icon: Icons.medical_services_outlined,
                      value: clinicName,
                    ),

                    SizedBox(height: 10.h),

                    _DoctorDialogInfoRow(
                      icon: Icons.location_on_outlined,
                      value: address,
                    ),

                    SizedBox(height: 10.h),

                    _DoctorDialogInfoRow(
                      icon: Icons.phone_android,
                      value: phone,
                    ),

                    if (email != null && email.trim().isNotEmpty) ...[
                      SizedBox(height: 10.h),
                      _DoctorDialogInfoRow(
                        icon: Icons.email_outlined,
                        value: email,
                      ),
                    ],

                    SizedBox(height: 14.h),

                    const Divider(
                      color: AppColors.white,
                      thickness: 1,
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                        color: AppColors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: AppButton(
                            title: primaryAction.title,
                            onTap: () {
                              Get.back();
                              primaryAction.onTap();
                            },
                            height: 54.h,
                            borderRadius: 24.r,
                            backgroundColor:
                                primaryAction.backgroundColor,
                            textColor: primaryAction.textColor,
                            icon: primaryAction.icon == null
                                ? null
                                : Icon(
                                    primaryAction.icon,
                                    color: primaryAction.textColor,
                                    size: 18.sp,
                                  ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                            ),
                            textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                              color: primaryAction.textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),

                        SizedBox(width: 14.w),

                        Expanded(
                          child: AppButton(
                            title: secondaryAction.title,
                            onTap: () {
                              Get.back();
                              secondaryAction.onTap();
                            },
                            height: 54.h,
                            borderRadius: 24.r,
                            backgroundColor:
                                secondaryAction.backgroundColor,
                            textColor: secondaryAction.textColor,
                            icon: secondaryAction.icon == null
                                ? null
                                : Icon(
                                    secondaryAction.icon,
                                    color: secondaryAction.textColor,
                                    size: 18.sp,
                                  ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                            ),
                            textStyle: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                              color: secondaryAction.textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
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

class _DoctorDialogInfoRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _DoctorDialogInfoRow({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          icon,
          size: 24.sp,
          color: AppColors.darkBlue,
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Text(
            value.trim().isEmpty ? '-' : value,
            textAlign: TextAlign.right,
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              fontSize: 18.sp,
              color: AppColors.black54,
            ),
          ),
        ),
      ],
    );
  }
}