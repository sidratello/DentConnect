import 'package:flutter/material.dart';
import 'package:template/Dentist/CasesPage/model/case_model.dart';
import 'package:template/Dentist/CasesPage/model/case_status.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class CaseFooterBuilder extends StatelessWidget {
  final CaseItem item;

  const CaseFooterBuilder({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    if (item.status == CaseStatus.delivered) {
      return Text(
        'السعر النهائي: ${item.finalPrice}',
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w500,
          fontSize: Static.getwidth(
            context,
            14,
          ),
          color: AppColors.priceBlue,
        ),
      );
    }

    return Text(
      'السعر: ${item.finalPrice}',
      style: TextStyle(
        fontFamily: 'IBM Plex Sans Arabic',
        fontWeight: FontWeight.w400,
        fontSize: Static.getwidth(
          context,
          14,
        ),
        color: AppColors.priceBlue,
      ),
    );
  }
}
