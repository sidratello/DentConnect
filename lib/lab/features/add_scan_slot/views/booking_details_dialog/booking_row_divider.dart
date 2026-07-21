import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';

class BookingRowDivider extends StatelessWidget {
  const BookingRowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.grey200,
    );
  }
}