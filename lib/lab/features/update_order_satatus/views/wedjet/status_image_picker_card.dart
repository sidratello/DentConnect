import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';
import '../../controller/update_order_status_controller.dart';

class StatusImagePickerCard extends StatelessWidget {
  const StatusImagePickerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateOrderStatusController>();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: AppHelper.whiteCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '   صور بعد تحديث الحالة',
            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'أضف صور للعمل الحالي (اختياري)',
            style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
              color: AppColors.normalText,
            ),
          ),
          const SizedBox(height: 14),

          Obx(() {
            final image = controller.selectedImage.value;

            return GestureDetector(
              onTap: controller.pickImage,
              child: Container(
                height: 130,
                width: double.infinity,
               decoration: AppHelper.whiteCardDecoration(
  radius: 16,
  backgroundColor: AppColors.littleBlue.withOpacity(.08),
  borderColor: AppColors.primaryBlue.withOpacity(.35),
),
                child: image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.primaryBlue,
                            size: 34,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'إضافة صورة',
                            style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'JPG, PNG , JPEG, , WEBP. ',
                            style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                              color: AppColors.normalText,
                            ),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          image,
                          width: double.infinity,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            );
          }),
        ],
      ),
    );
  }


}