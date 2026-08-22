import 'package:flutter/material.dart';
import 'package:template/Dentist/BlogDentists/view/post_details_wedjet/post_full_image_dialog.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class PostDoctorAttachments extends StatelessWidget {
  final List<BlogPostAttachment> attachments;

  const PostDoctorAttachments({
    super.key,
    required this.attachments,
  });

  static String baseUrl = '${Static.imageBaseUrl}/';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الصور المرفقة',
          style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
            color: AppColors.darkBlue,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: attachments.length,
            separatorBuilder: (_, __) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              final imageUrl = _buildImageUrl(attachments[index].path);

              return GestureDetector(
                onTap: () {
                  FullImageDoctorDialog.show(
                    context: context,
                    imageUrl: imageUrl,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    imageUrl,
                    width: 240,
                    height: 190,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      context,
                      child,
                      progress,
                    ) {
                      if (progress == null) {
                        return child;
                      }

                      return Container(
                        width: 240,
                        height: 190,
                        alignment: Alignment.center,
                        color: AppColors.littleBlue.withOpacity(.2),
                        child: const AppLoadingIndicator(
                          size: 26,
                          strokeWidth: 2,
                          centered: false,
                        ),
                      );
                    },
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return _ImageFallback();
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _buildImageUrl(String? path) {
    final imagePath = path?.trim() ?? '';

    if (imagePath.startsWith('http')) {
      return imagePath;
    }

    return '$baseUrl$imagePath';
  }
}

class _ImageFallback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 190,
      alignment: Alignment.center,
      color: AppColors.littleBlue.withOpacity(.2),
      child: const Icon(
        Icons.broken_image_outlined,
        color: AppColors.primaryBlue,
        size: 38,
      ),
    );
  }
}
