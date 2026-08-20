import 'package:flutter/material.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/image_item.dart';
import 'package:template/Dentist/CaseDetailsPage/view/CaseDetailsPageWidgets/section_title.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

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
          AppSpacing.height(context, 18),
          if (images.isEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: Static.getheight(context, 24),
                horizontal: Static.getwidth(context, 16),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: Static.getwidth(context, 52),
                    height: Static.getwidth(context, 52),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.photo_library_outlined,
                      size: Static.getwidth(context, 26),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.7),
                    ),
                  ),
                  AppSpacing.height(context, 12),
                  Text(
                    'لا توجد صور خاصة بالحالة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w600,
                      fontSize: Static.getwidth(context, 15),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  AppSpacing.height(context, 5),
                  Text(
                    'لم يتم إرفاق أي صور مع هذه الحالة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwidth(context, 12),
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.55),
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              height: Static.getheight(context, 120),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (_, __) => AppSpacing.width(context, 14),
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
