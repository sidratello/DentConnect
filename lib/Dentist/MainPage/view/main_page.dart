import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CreateOrderPage/view/create_order_page.dart';
import 'package:template/Dentist/DoctorProfile/view/doctor_profile.dart';
import 'package:template/Dentist/MainPage/controller/navigation_controller.dart';
import 'package:template/Dentist/SearchLabsPage/archive/search_labs_page.dart';

import '../../CasesPage/view/case_page.dart';
import '../../HomePage/view/home_page.dart';
import '../../HomePage/view/HomePageWidegts/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final NavigationController navigationController = Get.put(
    NavigationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: IndexedStack(
            index: navigationController.currentIndex.value,
            children: const [
              HomePage(),
              SearchLabsPage(),
              CreateOrderPage(),
              CasePage(),
              DoctorProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: navigationController.currentIndex.value,
            onTap: (index) {
              navigationController.changePage(
                index,
              );
            },
          ),
        ),
      ),
    );
  }
}
