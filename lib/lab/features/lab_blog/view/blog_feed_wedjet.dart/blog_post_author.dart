import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';

class BlogPostAuthor
    extends StatelessWidget {
  final String authorName;
  final bool isDoctor;
  final String profilePictureUrl;
  const BlogPostAuthor({
    super.key,
    required this.authorName,
    required this.isDoctor,
        this.profilePictureUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    final name = authorName.trim();

    final imageUrl = AppHelper.buildImageUrl(
      profilePictureUrl,
    );

    return Row(
      children: [
        _buildAuthorAvatar(
          imageUrl,
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                name.isEmpty
                    ? 'مستخدم'
                    : name,
                maxLines: 1,
                overflow:
                    TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 15,
                  fontWeight:
                      FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                isDoctor
                    ? 'طبيب أسنان'
                    : 'مخبر أسنان',
                style: const TextStyle(
                  color:
                      AppColors.normalText,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAuthorAvatar(
    String imageUrl,
  ) {
    return Container(
      width: 44,
      height: 44,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue
            .withOpacity(.09),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryBlue
              .withOpacity(.20),
        ),
      ),
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              loadingBuilder: (
                context,
                child,
                loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                }

                return _buildFallbackIcon();
              },
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return _buildFallbackIcon();
              },
            )
          : _buildFallbackIcon(),
    );
  }

  Widget _buildFallbackIcon() {
    return Center(
      child: Icon(
        isDoctor
            ? Icons.medical_services_outlined
            : Icons.biotech_outlined,
        color: AppColors.primaryBlue,
        size: 23,
      ),
    );
  }
}