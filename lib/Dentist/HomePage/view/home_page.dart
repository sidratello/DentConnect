import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/DrawerWidgets/app_drawer.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/appbar_home_text.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/home_ads_slider.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/home_quick_filters.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/labs_list_view.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/labs_section_header%20.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/appBar_notification_icon.dart';
import 'package:template/core_dentist/widgets/appBar_profile_image.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../../../core_dentist/theme/app_colors.dart';
import 'HomePageWidegts/appbar_home_vector_black.dart';

class HomePageWidget extends GetView<HomeController> {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          actions: [
            AppbarHomeText(
              isPreviewMode: controller.isPreviewMode.value,
            ),
            AppbarProfileImage(
              isPreviewMode: controller.isPreviewMode.value,
            ),
            const AppbarNotificationIcon(),
            const AppbarHomeVectorBlack(),
          ],
        ),
        body: TopBackground(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 4,
              ),
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: Static.getheight(context, 20)),
                    const HomeAdsSlider(),
                    SizedBox(
                      height: Static.getheight(context, 18),
                    ),
                    const HomeQuickFilters(),
                    SizedBox(
                      height: Static.getheight(context, 18),
                    ),
                    SizedBox(height: Static.getheight(context, 20)),
                    LabsSectionHeader(
                      selectedIndex: controller.selectedIndex.value,
                      onTap: (index) {
                        if (controller.selectedIndex.value == index) {
                          return;
                        }
                        controller.selectedIndex.value = index;
                        if (index == 0) {
                          controller.selectFilter(HomeFilter.none);
                        } else if (index == 1) {
                          controller.selectFilter(HomeFilter.disconnected);
                        } else if (index == 2) {
                          controller.selectFilter(HomeFilter.connected);
                        }
                      },
                    ),
                    SizedBox(height: Static.getheight(context, 20)),
                    controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : const LabsListView(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HomePageWidget();
  }
}
