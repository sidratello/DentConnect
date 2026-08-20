import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

import 'lab_image_viewer.dart';

class LabImageItem extends StatelessWidget {
  final String? imagePath;
  final String heroTag;

  const LabImageItem({
    super.key,
    required this.imagePath,
    required this.heroTag,
  });

  String? _getImageUrl() {
    if (imagePath == null || imagePath!.trim().isEmpty) {
      return null;
    }

    final path = imagePath!.trim();

    // إذا كان Relative Path قادم من الـ Backend
    return '${Static.imageBaseUrl}/$path';
  }

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = _getImageUrl();

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: imageUrl == null
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LabImageViewer(
                    imagePath: imageUrl,
                    heroTag: heroTag,
                  ),
                ),
              );
            },
      child: Hero(
        tag: heroTag,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(
                  alpha: 0.08,
                ),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      );
                    },
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return Image.asset(
                        'assets/images/lab_card.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.asset(
                    'assets/images/lab_card.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
