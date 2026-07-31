import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';

class AuthorProfilePicture extends StatelessWidget {
  final String imageUrl;
  final bool isLab;
  final double size;

  const AuthorProfilePicture({
    super.key,
    required this.imageUrl,
    required this.isLab,
    this.size = 52,
  });

  @override
  Widget build(BuildContext context) {
    final completeUrl =
        AppHelper.buildImageUrl(imageUrl);

    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.littleBlue.withOpacity(.20),
        border: Border.all(
          color: AppColors.littleBlue,
          width: 1.5,
        ),
      ),
      child: completeUrl.isNotEmpty
          ? Image.network(
              completeUrl,
              width: size,
              height: size,
              fit: BoxFit.cover,
              loadingBuilder: (
                context,
                child,
                loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                }

                return _buildFallback();
              },
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return _buildFallback();
              },
            )
          : _buildFallback(),
    );
  }

  Widget _buildFallback() {
    return Center(
      child: Icon(
        isLab
            ? Icons.biotech_outlined
            : Icons.person_outline_rounded,
        color: AppColors.darkBlue,
        size: size * .52,
      ),
    );
  }
}