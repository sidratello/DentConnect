
import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/InfoText.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class DoctorInfo extends StatelessWidget {
  final LabOrderModel order;

  const DoctorInfo({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.background,
          backgroundImage: const AssetImage(
         'assets/images/6ddad445-e427-41f3-abe6-c4b7d25de1b6-removebg-preview.png',
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(  'د. ${order.dentistName}',
                style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),),
          InfoText(   order.dentistEmail,
               style: AppTextStyles.ibmRegular14NeutralStyle,),

                  InfoText(   
               order.dentistPhone,
                style: AppTextStyles.ibmRegular14NeutralStyle,
               ),
         
           
          
               
                  InfoText(   
         'عنوان العيادة: ${order.dentistClinicAddress}',
                style: AppTextStyles.ibmRegular14NeutralStyle,
               ),
     
            ],
          ),
        ),
      ],
    );
  }
}


class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool multiline;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.darkBlue,
          ),
        ),
      ),
      child: multiline
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.ibmMedium18NeutralStyle,
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: AppTextStyles.ibmRegular14NeutralStyle,
                ),
              ],
            )
          : Row(
              children: [
                Text(
                  label,
                  style: AppTextStyles.ibmMedium18NeutralStyle,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    value,
                    style: AppTextStyles.ibmRegular14NeutralStyle,
                  ),
                ),
              ],
            ),
    );
  }
}



