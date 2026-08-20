import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/DoctorProfile/view/DoctorProfileWidegts/contact_info.dart';
import 'package:template/Dentist/DoctorProfile/view/DoctorProfileWidegts/preview_profile.dart';
import 'package:template/Dentist/DoctorProfile/view/DoctorProfileWidegts/profile_header.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/DrawerWidgets/app_drawer.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

class DoctorProfilePage extends GetView<HomeController> {
  const DoctorProfilePage({super.key});

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
          centerTitle: true,
          title: Text(
            'الملف الشخصي للطبيب',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
        body: TopBackground(
          body: SafeArea(
            child: Obx(() {
              if (controller.isPreviewMode.value) {
                return const PreviewProfile();
              }
              return const SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    ProfileHeader(),
                    SizedBox(height: 24),
                    ContactInfo(),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
