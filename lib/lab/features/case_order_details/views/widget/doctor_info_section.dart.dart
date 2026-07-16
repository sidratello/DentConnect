import 'package:flutter/material.dart';
import 'package:template/lab/features/case_order_details/views/widget/SectionTitle.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_info_item.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';

import 'package:template/lab/shared/models/lab_order_model.dart';

class DoctorInfoSection extends StatelessWidget {
  final LabOrderModel order;

  const DoctorInfoSection({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'معلومات الطبيب',
            icon: Icons.person_outline_rounded,
          ),

          const SizedBox(height: 16),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: .85,
            children: [
              DetailsInfoItem(
                icon: Icons.person_outline_rounded,
                title: 'الاسم',
                value: 'د. ${order.dentistName}',
              ),

              DetailsInfoItem(
                icon: Icons.phone_outlined,
                title: 'الهاتف',
                value: order.dentistPhone,
              ),

              DetailsInfoItem(
                icon: Icons.email_outlined,
                title: 'البريد',
                value: order.dentistEmail,
              ),

              DetailsInfoItem(
                icon: Icons.location_on_outlined,
                title: 'العنوان',
                value: order.dentistClinicAddress,
              ),
            ],
          ),
        ],
      ),
    );
  }
}