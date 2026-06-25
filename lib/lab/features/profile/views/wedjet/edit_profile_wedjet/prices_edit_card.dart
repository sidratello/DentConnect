import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/profile/controller/profilecontroller.dart';
import 'package:template/lab/features/profile/controller/editprofilecontroller.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/custom_action_dialog.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';
import 'package:template/lab/features/profile/views/wedjet/profile_wedjet.dart/text_for_table.dart';

class PricesEditCard extends StatelessWidget {

  final EditLabProfileController controller;

  const PricesEditCard({
    super.key,
   
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
   final profileController = Get.find<LabProfileController>();

return Obx(() {
final profile = profileController.profile.value;

if (profile == null) {
  return const SizedBox();
}

final prices = profile.prices;

    return ProfileSectionCard(
      title: 'تعديل الأسعار والتعويضات',
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (prices.isEmpty)
          Text(
            'لا توجد أسعار',
            style: AppTextStyles.ibmRegular14NeutralStyle,
          )
        else ...[
          _HeaderRow(),
          SizedBox(height: 8.h),

          ...prices.map((item) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.primaryBlue.withOpacity(.15),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      item.compensationType,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Text(
                      '${item.unitPrice}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

         

                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.orange,
                            size: 20,
                          ),
                          onPressed: () {
 final priceController = TextEditingController(
      text: item.unitPrice.toString(),
    );

    CustomActionDialog.show(
      context: context,
      title: 'تعديل السعر',

      content: TextFormField(
        controller: priceController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'السعر الجديد',
        ),
      ),

      confirmButton: TextButton(
    onPressed: () {
      controller.updatePrice(
        priceId: item.id,
        unitPrice: priceController.text.trim(),
      );

      Get.back();
    },
    child: const Text('حفظ'),
  ),
    );
  
                          },
                        ),

                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 20,
                          ),
                          onPressed: () {
 CustomActionDialog.show(
      context: context,
      title: 'حذف السعر',
      content: const Text(
        'هل أنت متأكد من حذف هذا السعر؟',
      ),
      confirmButton: TextButton(
    onPressed: () {
      controller.deletePrice(item.id);

      Get.back();
    },
    child: const Text('حذف'),
  ),
    );
  },
                          
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ],
    );
  
});}


}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          HeaderText(text: 'نوع التعويض', flex: 2),
          HeaderText(text: 'السعر', flex: 2),
       
          HeaderText(text: 'إجراءات', flex: 2),
        ],
      ),
    );
  }
}

