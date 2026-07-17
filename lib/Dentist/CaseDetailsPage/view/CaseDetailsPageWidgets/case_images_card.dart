import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/image_item.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';

class CaseImagesCard extends StatelessWidget {
  final List<String> images;

  const CaseImagesCard({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
      padding: EdgeInsets.all(
        Static.getwidth(context, 20),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            icon: Icons.photo_library_rounded,
            title: 'صور الحالة',
          ),
          AppSpacing.height(
            context,
            18,
          ),
          SizedBox(
            height: Static.getheight(
              context,
              120,
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => AppSpacing.width(
                context,
                14,
              ),
              itemBuilder: (context, index) => ImageItem(
                image: images[index],
                heroTag: 'case_$index',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
