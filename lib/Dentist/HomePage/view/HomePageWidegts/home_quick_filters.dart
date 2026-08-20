import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/quick_filter_chip.dart';
import 'package:template/core_dentist/utils/static.dart';

class HomeQuickFilters extends StatelessWidget {
  const HomeQuickFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SizedBox(
      height: Static.getheight(
        context,
        52,
      ),
      child: Obx(
        () => ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: Static.getwidth(
              context,
              24,
            ),
          ),
          children: [
            QuickFilterChip(
              icon: Icons.wrong_location_outlined,
              title: 'حسب الموقع',
              isSelected:
                  controller.selectedFilter.value == HomeFilter.location,
              onTap: () => controller.selectFilter(HomeFilter.location),
            ),
            QuickFilterChip(
              icon: Icons.star_rounded,
              title: 'الأعلى تقييماً',
              isSelected:
                  controller.selectedFilter.value == HomeFilter.topRated,
              onTap: () => controller.selectFilter(HomeFilter.topRated),
            ),
            QuickFilterChip(
              icon: Icons.check_circle_rounded,
              title: 'متوفر حالياً',
              isSelected:
                  controller.selectedFilter.value == HomeFilter.available,
              onTap: () => controller.selectFilter(HomeFilter.available),
            ),
            QuickFilterChip(
              icon: Icons.qr_code_scanner_rounded,
              title: 'ماسح متنقل',
              isSelected:
                  controller.selectedFilter.value == HomeFilter.mobileScanner,
              onTap: () => controller.selectFilter(HomeFilter.mobileScanner),
            ),
          ],
        ),
      ),
    );
  }
}
