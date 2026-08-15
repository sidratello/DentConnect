import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core/utils/static.dart';

import '../../../../core/theme/app_colors.dart';

class HomeAdsSlider extends StatelessWidget {
  const HomeAdsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final appModeController = Get.find<HomeController>();

    return Obx(() => appModeController.advertisements.isEmpty
        ? Center(
            child: Text(
              'لا توجد إعلانات متاحة',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 14),
                color: AppColors.black54,
              ),
            ),
          )
        : Column(
            children: [
              SizedBox(
                width: Static.getwidth(context, 380),
                height: Static.getheight(context, 180),
                child: PageView.builder(
                  controller: appModeController.adsPageController,
                  itemCount: appModeController.advertisements.length,
                  onPageChanged: (index) {
                    appModeController.currentAdIndex.value = index;
                  },
                  itemBuilder: (_, index) {
                    final ad = appModeController.advertisements[index];

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            '${Static.imageBaseUrl}/${ad.images!.first}',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: .6),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 18,
                            left: 18,
                            bottom: 18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ad.title ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Static.getwidth(context, 18),
                                    fontFamily: 'IBM Plex Sans Arabic',
                                  ),
                                ),
                                SizedBox(
                                  height: Static.getheight(context, 4),
                                ),
                                Text(
                                  ad.content ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: Static.getwidth(context, 13),
                                    fontFamily: 'IBM Plex Sans Arabic',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: Static.getheight(context, 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  appModeController.advertisements.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: appModeController.currentAdIndex.value == index
                        ? 18
                        : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: appModeController.currentAdIndex.value == index
                          ? AppColors.primary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ));
  }
}
