




import 'package:flutter/material.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order/model/order_model.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/ToothInfo.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/tooth_card.dart';

class TeethCompensationGrid extends StatelessWidget {
  final LabOrderModel order;

  const TeethCompensationGrid({
    super.key,
    required this.order,
  });

  String _toothImage(int toothNumber) {
    final digit = toothNumber % 10;

    if (digit == 1 || digit == 2) {
      return 'assets/images/incisor.png';
    }

    if (digit == 3) {
      return 'assets/images/canine.png';
    }

    if (digit == 4 || digit == 5) {
      return 'assets/images/premolar__1_-removebg-preview.png';
    }

    return 'assets/images/ChatGPT_Image_Jun_20__2026__02_22_49_PM-removebg-preview.png';
  }

  @override
  Widget build(BuildContext context) {
    final teeth = order.items.expand((item) {
      return item.toothNumbers.map((toothNumber) {
        return ToothInfo(
          toothNumber: toothNumber,
          compensationType: item.compensationType,
          imagePath: _toothImage(toothNumber),
        );
      });
    }).toList();

    if (teeth.isEmpty) {
      return Text(
        'لا يوجد نوع تعويض',
        style: AppTextStyles.ibmMedium18NeutralStyle,
      );
    }

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: teeth.map((tooth) {
        return ToothCard(tooth: tooth);
      }).toList(),
    );
  }
}

