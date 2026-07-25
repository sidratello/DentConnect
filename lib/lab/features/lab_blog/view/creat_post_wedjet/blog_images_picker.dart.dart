import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

import '../../controller/create_blog_controller.dart';
import 'blog_selected_images.dart';

class BlogImagesPicker extends StatelessWidget {
  const BlogImagesPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<CreateBlogController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.image_outlined,
              color: AppColors.darkBlue,
              size: 22,
            ),
            const SizedBox(width: 7),
            Text(
              'الصور المرفقة',
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '(اختياري)',
              style: AppTextStyles
                  .ibmRegular12DarkStyle
                  .copyWith(
                color: AppColors.normalText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: controller.pickImages,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue
                  .withOpacity(.025),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color:
                    AppColors.primaryBlue.withOpacity(.60),
                width: 1.2,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  color: AppColors.primaryBlue,
                  size: 38,
                ),
                const SizedBox(height: 8),
                Text(
                  'اضغط لإضافة صور',
                  style: AppTextStyles
                      .ibmRegular16WhiteStyle
                      .copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'يمكنك اختيار عدة صور من المعرض',
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color: AppColors.normalText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'PNG، JPG، JPEG',
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color: AppColors.normalText,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        const BlogSelectedImages(),
      ],
    );
  }
}