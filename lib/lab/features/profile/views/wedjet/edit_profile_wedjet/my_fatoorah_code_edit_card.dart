import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/app_button.dart';
import 'package:template/core/widgets/input_textfield.dart';

import '../../../controller/editprofilecontroller.dart';

class MyFatoorahCodeEditCard
    extends StatelessWidget {
  final EditLabProfileController
      controller;

  const MyFatoorahCodeEditCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.55),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue
                .withOpacity(.04),
            blurRadius: 14,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Row(
            textDirection:
                TextDirection.rtl,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors
                      .littleBlue
                      .withOpacity(.4),
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),
                child: const Icon(
                  Icons
                      .account_balance_wallet_outlined,
                  color:
                      AppColors.primaryBlue,
                  size: 23,
                ),
              ),

              const SizedBox(width: 11),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'كود حساب المخبر',
                      textAlign:
                          TextAlign.right,
                      style: AppTextStyles
                          .ibmMedium18NeutralStyle
                          .copyWith(
                        color:
                            AppColors.darkBlue,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'يستخدم الطبيب هذا الكود لتحويل المدفوعات إلى حساب المخبر.',
                      textAlign:
                          TextAlign.right,
                      style: AppTextStyles
                          .ibmRegular14NeutralStyle
                          .copyWith(
                        color: AppColors
                            .normalText,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          AuthInputField(
            title:
                'كود MyFatoorah',
            hintText:
                'أدخل كود حساب المخبر',
            controller: controller
                .myFatoorahCodeController,
            keyboardType:
                TextInputType.number,
            prefixIcon: const Icon(
              Icons.numbers_rounded,
              color:
                  AppColors.primaryBlue,
            ),
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty) {
                return 'يرجى إدخال كود الحساب';
              }

              return null;
            },
          ),

          const SizedBox(height: 14),

          Obx(
            () => AppButton(
              title:
                  'حفظ كود الحساب',
              type:
                  AppButtonType.gradient,
              height: 50,
              borderRadius: 13,
              isLoading: controller
                  .isMyFatoorahCodeLoading
                  .value,
              icon: const Icon(
                Icons
                    .save_outlined,
                color:
                    AppColors.white,
                size: 20,
              ),
              onTap: controller
                  .updateMyFatoorahSupplierCode,
            ),
          ),
        ],
      ),
    );
  }
}