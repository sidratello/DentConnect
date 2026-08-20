import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/PatientPage/model/patient_model.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class TeethImagesGrid extends StatelessWidget {
  final List<UploadedFiles> images;

  const TeethImagesGrid({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final beforeImages = images
        .where(
          (image) => image.fileType == 'PhotoBefore',
        )
        .toList();

    final afterImages = images
        .where(
          (image) => image.fileType == 'PhotoAfter',
        )
        .toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(
          context,
          18,
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          18,
        ),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'صور الحالة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(
                context,
                17,
              ),
            ),
          ),
          SizedBox(
            height: Static.getheight(
              context,
              18,
            ),
          ),
          _PhotoSection(
            title: 'الصور قبل العلاج',
            icon: Icons.photo_camera_front_outlined,
            images: beforeImages,
          ),
          SizedBox(
            height: Static.getheight(
              context,
              20,
            ),
          ),
          const Divider(),
          SizedBox(
            height: Static.getheight(
              context,
              20,
            ),
          ),
          _PhotoSection(
            title: 'الصور بعد العلاج',
            icon: Icons.photo_camera_back_outlined,
            images: afterImages,
          ),
        ],
      ),
    );
  }
}

class _PhotoSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<UploadedFiles> images;

  const _PhotoSection({
    required this.title,
    required this.icon,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: Static.getwidth(
                context,
                38,
              ),
              height: Static.getheight(
                context,
                38,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: 0.08,
                ),
                borderRadius: BorderRadius.circular(
                  11,
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: Static.getwidth(
                  context,
                  20,
                ),
              ),
            ),
            SizedBox(
              width: Static.getwidth(
                context,
                10,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w600,
                  fontSize: Static.getwidth(
                    context,
                    15,
                  ),
                ),
              ),
            ),
            if (images.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Static.getwidth(
                    context,
                    8,
                  ),
                  vertical: Static.getheight(
                    context,
                    4,
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: 0.08,
                  ),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: Text(
                  '${images.length}',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w600,
                    fontSize: Static.getwidth(
                      context,
                      11,
                    ),
                    color: AppColors.primary,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          height: Static.getheight(
            context,
            14,
          ),
        ),
        if (images.isEmpty)
          _buildEmptyState(context)
        else
          _buildImagesGrid(
            context,
            images,
          ),
      ],
    );
  }

  Widget _buildImagesGrid(
    BuildContext context,
    List<UploadedFiles> images,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.15,
      ),
      itemBuilder: (context, index) {
        final image = images[index];

        return InkWell(
          borderRadius: BorderRadius.circular(
            14,
          ),
          onTap: () {
            _showImagePreview(
              context,
              image,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              14,
            ),
            child: Image.network(
              '${Static.imageBaseUrl}/${image.path}',
              fit: BoxFit.cover,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return Container(
                  color: const Color(0xFFF5F6FA),
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: AppColors.black54,
                    size: Static.getwidth(
                      context,
                      30,
                    ),
                  ),
                );
              },
              loadingBuilder: (
                context,
                child,
                loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                }

                return Container(
                  color: const Color(0xFFF5F6FA),
                  child: Center(
                    child: SizedBox(
                      width: Static.getwidth(
                        context,
                        22,
                      ),
                      height: Static.getheight(
                        context,
                        22,
                      ),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(
          context,
          22,
        ),
        horizontal: Static.getwidth(
          context,
          12,
        ),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(
          14,
        ),
        border: Border.all(
          color: AppColors.border.withValues(
            alpha: 0.7,
          ),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: Static.getwidth(
              context,
              28,
            ),
            color: AppColors.black54.withValues(
              alpha: 0.55,
            ),
          ),
          SizedBox(
            height: Static.getheight(
              context,
              8,
            ),
          ),
          Text(
            'لا توجد صور في هذا القسم',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w500,
              fontSize: Static.getwidth(
                context,
                12,
              ),
              color: AppColors.black54,
            ),
          ),
        ],
      ),
    );
  }

  void _showImagePreview(
    BuildContext context,
    UploadedFiles image,
  ) {
    print('${Static.imageBaseUrl}/${image.path}************');
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(
          Static.getwidth(
            context,
            16,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            18,
          ),
          child: InteractiveViewer(
            child: Image.network(
              '${Static.imageBaseUrl}/${image.path}',
              fit: BoxFit.contain,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return Container(
                  height: Static.getheight(
                    context,
                    300,
                  ),
                  color: AppColors.white,
                  child: const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
