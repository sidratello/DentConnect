import 'package:flutter/material.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/appbar_home_text.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/bottom_nav_bar.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/home_ads_slider.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/labs_list_view.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/labs_section_header%20.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/appBar_notification_icon.dart';
import 'package:template/core/widgets/appBar_profile_image.dart';
import 'package:template/core/widgets/top_background.dart';

class HomePage extends StatelessWidget {
  final bool isPreviewMode;

  const HomePage({
    super.key,
    required this.isPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 250, 255, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: const AppbarNotificationIcon(),
        actions: [
          AppbarHomeText(
            isPreviewMode: isPreviewMode,
          ),
          AppbarProfileImage(
            isPreviewMode: isPreviewMode,
          ),
        ],
      ),
      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 4,
            ),
            child: Column(
              children: [
                SizedBox(height: Static.getheight(context, 20)),
                const HomeAdsSlider(),
                SizedBox(height: Static.getheight(context, 20)),
                LabsSectionHeader(
                  selectedIndex: 0,
                  isPreviewMode: isPreviewMode,
                  onTap: (index) {},
                ),
                SizedBox(height: Static.getheight(context, 20)),
                LabsListView(
                  isPreviewMode: isPreviewMode,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {},
        isPreviewMode: isPreviewMode,
      ),
    );
  }
}
