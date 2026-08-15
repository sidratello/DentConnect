import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/DrawerWidgets/app_drawer.dart';
import 'package:template/Dentist/SearchLabsPage/view/SearchLabsPageWidgets/search_action_buttons.dart';
import 'package:template/Dentist/SearchLabsPage/view/SearchLabsPageWidgets/search_lab_textfield.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/top_background.dart';
import '../../../core/theme/app_colors.dart';

class SearchLabsPage extends GetView<HomeController> {
  const SearchLabsPage({super.key});

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
            'البحث عن مخبر',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
        body: TopBackground(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.height(context, 12),
                  const SearchLabTextField(),
                  AppSpacing.height(context, 20),
                  const SearchActionButtons(),
                  AppSpacing.height(context, 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
