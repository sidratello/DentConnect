import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';

class BlogPostAuthor
    extends StatelessWidget {
  final String authorName;
  final bool isDoctor;

  const BlogPostAuthor({
    super.key,
    required this.authorName,
    required this.isDoctor,
  });

  @override
  Widget build(BuildContext context) {
    final name = authorName.trim();

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue
                .withOpacity(.09),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryBlue
                  .withOpacity(.20),
            ),
          ),
          child: Icon(
            isDoctor
                ? Icons
                    .medical_services_outlined
                : Icons.biotech_outlined,
            color: AppColors.primaryBlue,
            size: 23,
          ),
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
}