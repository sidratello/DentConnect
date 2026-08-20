import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_image.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad_feed/AdImagesGalleryScreen.dart';

class LabAdDetailsImageSection extends StatelessWidget {
  final List<String> images;

  const LabAdDetailsImageSection({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            const Icon(
              Icons.image_outlined,
              color: AppColors.darkBlue,
              size: 22,
            ),

            const SizedBox(width: 7),

            Text(
              'صور الإعلان',
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w800,
              ),
            ),

            if (images.isNotEmpty) ...[
              const SizedBox(width: 6),
              Text(
                '(${images.length})',
                style: AppTextStyles
                    .ibmRegular12DarkStyle
                    .copyWith(
                  color: AppColors.normalText,
                ),
              ),
            ],
          ],
        ),

        const SizedBox(height: 10),

        // No images
        if (images.isEmpty)
          const AppNetworkContentImage(
            imagePath: null,
            aspectRatio: 16 / 8.5,
            borderRadius: 16,
          )

        // One image
        else if (images.length == 1)
          InkWell(
            onTap: () {
              _openGallery(0);
            },
            borderRadius: BorderRadius.circular(16),
            child: AppNetworkContentImage(
              imagePath: images.first,
              aspectRatio: 16 / 8.5,
              borderRadius: 16,
            ),
          )

        // Multiple images
        else
          SizedBox(
            height: 185,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(
                width: 10,
              ),
              itemBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width:
                      MediaQuery.sizeOf(context).width *
                          .72,
                  child: InkWell(
                    onTap: () {
                      _openGallery(index);
                    },
                    borderRadius:
                        BorderRadius.circular(16),
                    child: AppNetworkContentImage(
                      imagePath: images[index],
                      aspectRatio: 16 / 9,
                      borderRadius: 16,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  void _openGallery(int index) {
    Get.to(
      () => AdImagesGalleryScreen(
        images: images,
        initialIndex: index,
      ),
    );
  }
}