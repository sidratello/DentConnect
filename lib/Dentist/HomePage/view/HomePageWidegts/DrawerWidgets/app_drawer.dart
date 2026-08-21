import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/InvoicesPage/controller/invoice_controller.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core_dentist/utils/static.dart';

import '../../../../../core_dentist/theme/app_colors.dart';
import '../../../../../core_dentist/theme/theme_controller.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/theme_controller.dart';
import '../../../../InvoicesPage/view/invoice_page.dart';

import 'drawer_header.dart';
import 'drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Static.getwidth(context, 20),
          ),
          child: Column(
            children: [
              const DrawerHeaderWidget(),
              SizedBox(
                height: Static.getheight(context, 30),
              ),
              DrawerItem(
                title: 'ملفات المرضى',
                icon: Icons.people_alt,
                onTap: () {
                  Get.toNamed(
                    AppRouter.patientsPage,
                  );
                },
              ),
              DrawerItem(
                title: 'القوالب',
                icon: Icons.description,
                onTap: () {
                  Get.toNamed(
                    AppRouter.templatesPage,
                  );
                },
              ),
              DrawerItem(
                title: 'المدونة',
                icon: Icons.article,
                onTap: () {
                  Get.toNamed(
                    AppRouter.communityPage,
                  );
                },
              ),
              DrawerItem(
                title: 'الشكاوي',
                icon: Icons.report_problem,
                onTap: () {
                  Get.toNamed(
                    AppRouter.complaintPage,
                  );
                },
              ),
              DrawerItem(
                title: 'الفواتير',
                icon: Icons.receipt_long,
                onTap: () {
                  Get.to(
                    () {
                      Get.put(InvoiceController());
                      return const InvoicesPage();
                    },
                  );
                },
              ),
              const Divider(),
              Material(
                  color: AppColors.surfaceTintColor,
                  child: Obx(
                    () => SwitchListTile(
                      value: themeController.isDarkMode.value,
                      onChanged: themeController.toggleTheme,
                      title: const Text(
                        'الوضع الليلي',
                      ),
                      secondary: Icon(
                        themeController.isDarkMode.value
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                    ),
                  )),
              const Spacer(),
              DrawerItem(
                title: 'تسجيل الخروج',
                icon: Icons.logout,
                onTap: () {
                  Get.defaultDialog(
                    title: 'تسجيل الخروج',
                    middleText: 'هل أنت متأكد؟',
                    textConfirm: 'خروج',
                    textCancel: 'إلغاء',
                  );
                },
              ),
              SizedBox(
                height: Static.getheight(context, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
