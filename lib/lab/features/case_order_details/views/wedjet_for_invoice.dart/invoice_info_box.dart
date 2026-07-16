
import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';


class InvoiceInfoBox extends StatelessWidget {
  const InvoiceInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.littleBlue.withOpacity(.6),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        'يتم حساب هذه الفاتورة بناءً على أسعار أنواع التعويضات التي أدخلها المخبر في الملف الشخصي.',
        textAlign: TextAlign.right,
        style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
          color: AppColors.textDark,
          height: 1.8,
        ),
      ),
    );
  }
}