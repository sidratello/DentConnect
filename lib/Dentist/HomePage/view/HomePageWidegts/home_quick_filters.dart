import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/location_filter_chip.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/quick_filter_chip.dart';
import 'package:template/core/utils/static.dart';

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
            LocationFilterChip(
              selectedLocation: controller.selectedLocation.value,
              locations: const [
                'كل المواقع',
                'دمشق',
                'ريف دمشق',
                'حلب',
                'حمص',
                'اللاذقية',
                'طرطوس',
              ],
              onSelected: controller.changeLocation,
            ),
            QuickFilterChip(
              icon: Icons.star_rounded,
              title: 'الأعلى تقييماً',
              isSelected: controller.topRated.value,
              onTap: controller.toggleTopRated,
            ),
            QuickFilterChip(
              icon: Icons.check_circle_rounded,
              title: 'متوفر حالياً',
              isSelected: controller.available.value,
              onTap: controller.toggleAvailable,
            ),
            QuickFilterChip(
              icon: Icons.qr_code_scanner_rounded,
              title: 'ماسح متنقل',
              isSelected: controller.mobileScanner.value,
              onTap: controller.toggleMobileScanner,
            ),
          ],
        ),
      ),
    );
  }
}
