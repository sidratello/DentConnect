

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

import 'blog_selected_images.dart';

class BlogDoctorImagesPicker extends StatelessWidget {
  final RxList<File> selectedImages;
  final Future<void> Function() onPickImages;
  final void Function(int index) onRemoveImage;

  final String title;
  final bool isOptional;

  const BlogDoctorImagesPicker({
    super.key,
    required this.selectedImages,
    required this.onPickImages,
    required this.onRemoveImage,
    this.title = 'الصور المرفقة',
    this.isOptional = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
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
              title,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (isOptional) ...[
              const SizedBox(width: 6),
              Text(
                '(اختياري)',
                style: AppTextStyles
                    .ibmRegular12DarkStyle
                    .copyWith(
                  color:
                      AppColors.normalText,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: onPickImages,
          borderRadius:
              BorderRadius.circular(15),
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue
                  .withOpacity(.025),
              borderRadius:
                  BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.primaryBlue
                    .withOpacity(.60),
                width: 1.2,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  color:
                      AppColors.primaryBlue,
                  size: 38,
                ),
                const SizedBox(height: 8),
                Text(
                  'اضغط لإضافة صور',
                  style: AppTextStyles
                      .ibmRegular16WhiteStyle
                      .copyWith(
                    color:
                        AppColors.primaryBlue,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'يمكنك اختيار عدة صور من المعرض',
                  textAlign: TextAlign.center,
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color:
                        AppColors.normalText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'PNG، JPG، JPEG، WEBP',
                  style: AppTextStyles
                      .ibmRegular12DarkStyle
                      .copyWith(
                    color:
                        AppColors.normalText,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        BlogSelectedImages(
          selectedImages: selectedImages,
          onPickImages: onPickImages,
          onRemoveImage: onRemoveImage,
        ),
      ],
    );
  }
}