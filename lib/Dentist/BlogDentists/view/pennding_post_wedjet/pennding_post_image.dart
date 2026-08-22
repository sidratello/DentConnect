
import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';

class BlogDoctorPostImage extends StatelessWidget {
  final String? path;

  const BlogDoctorPostImage({
    super.key,
    required this.path,
  });

  static const String baseUrl =
      'http://192.168.1.3:44334/';

  @override
  Widget build(BuildContext context) {
    final imagePath = path ?? '';

    if (imagePath.isEmpty) {
      return _fallback();
    }

    final imageUrl =
        imagePath.startsWith('http')
            ? imagePath
            : '$baseUrl$imagePath';

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: 95,
        height: 95,
        fit: BoxFit.cover,
        errorBuilder: (
          context,
          error,
          stackTrace,
        ) {
          return _fallback();
        },
        loadingBuilder: (
          context,
          child,
          progress,
        ) {
          if (progress == null) {
            return child;
          }

          return Container(
            width: 95,
            height: 95,
            alignment: Alignment.center,
            color:
                AppColors.littleBlue.withOpacity(.2),
  child: const AppLoadingIndicator(
  size: 24,
  strokeWidth: 2,
  centered: false,
),
          );
        },
      ),
    );
  }

  Widget _fallback() {
    return Container(
      width: 95,
      height: 95,
      decoration: BoxDecoration(
        color:
            AppColors.littleBlue.withOpacity(.25),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_outlined,
        color: AppColors.primaryBlue,
        size: 32,
      ),
    );
  }
}