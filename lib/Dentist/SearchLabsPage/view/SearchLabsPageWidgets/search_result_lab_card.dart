import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../../LabDetailsPage/view/lab_details_page.dart';
import '../../model/search_lab_model.dart';

class SearchResultLabCard extends StatelessWidget {
  final Labs lab;

  const SearchResultLabCard({
    super.key,
    required this.lab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Get.to(() => LabDetailsPage(id: lab.labId!));
      },
      child: Container(
        padding: EdgeInsets.all(
          Static.getwidth(context, 14),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(
                alpha: 0.04,
              ),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: lab.profilePictureUrl != null &&
                      lab.profilePictureUrl!.isNotEmpty
                  ? Image.network(
                      Static.imageBaseUrl + lab.profilePictureUrl!,
                      width: Static.getwidth(context, 90),
                      height: Static.getheight(context, 90),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/lab_card.png',
                          width: Static.getwidth(context, 90),
                          height: Static.getheight(context, 90),
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/images/lab_card.png',
                      width: Static.getwidth(context, 90),
                      height: Static.getheight(context, 90),
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: Static.getwidth(context, 12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lab.placeName!,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w600,
                      fontSize: Static.getwidth(context, 17),
                    ),
                  ),
                  SizedBox(height: Static.getheight(context, 6)),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 16,
                        color: AppColors.greyLight,
                      ),
                      const SizedBox(width: 4),
                      Text(lab.city!),
                    ],
                  ),
                  SizedBox(height: Static.getheight(context, 6)),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.yellowRate,
                      ),
                      Text(lab.averageRating.toString()),
                    ],
                  ),
                  SizedBox(height: Static.getheight(context, 8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
