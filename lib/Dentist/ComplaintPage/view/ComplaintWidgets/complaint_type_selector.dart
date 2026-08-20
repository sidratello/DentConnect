import 'package:flutter/material.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_type_card.dart';
import 'package:template/core_dentist/utils/static.dart';

class ComplaintTypeSelector extends StatelessWidget {
  const ComplaintTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  final int selectedType;
  final ValueChanged<int> onTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع الشكوى',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: Static.getwidth(context, 14),
            fontWeight: FontWeight.w700,
            color: const Color(0xff252A34),
          ),
        ),
        SizedBox(height: Static.getheight(context, 12)),
        Row(
          children: [
            Expanded(
              child: ComplaintTypeCard(
                isSelected: selectedType == 0,
                icon: Icons.admin_panel_settings_outlined,
                title: 'شكوى للإدارة',
                subtitle: 'شكوى عامة',
                onTap: () => onTypeChanged(0),
              ),
            ),
            SizedBox(width: Static.getwidth(context, 12)),
            Expanded(
              child: ComplaintTypeCard(
                isSelected: selectedType == 1,
                icon: Icons.business_outlined,
                title: 'شكوى لمخبر',
                subtitle: 'شكوى متعلقة بمخبر',
                onTap: () => onTypeChanged(1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
