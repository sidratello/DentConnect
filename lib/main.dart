import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CasesPage/controller/case_controller.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/PatientPage/controller/patient_controller.dart';
import 'package:template/Dentist/TemplatesPage/controller/template_controller.dart';
import 'package:template/core_dentist/app_router.dart';
import 'package:template/core_dentist/storage_services.dart';
import 'package:template/core_dentist/theme/app_theme.dart';
import 'package:template/core_dentist/theme/theme_controller.dart';
import 'package:get_storage/get_storage.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);

    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    return client;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<StorageService>(
    () async => await StorageService().init(),
  );

  Get.put(HomeController());
  Get.put(CreateOrderController());
  Get.put(ThemeController());
  Get.put(TemplateController());
  Get.put(CaseController());
  Get.put(PatientController());

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return ScreenUtilInit(
      designSize: const Size(402, 1057),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (
        context,
        child,
      ) {
        return Obx(
          () => GetMaterialApp(
            locale: const Locale(
              'ar',
            ),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.isDarkMode.value
                ? ThemeMode.dark
                : ThemeMode.light,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            getPages: AppRouter.pages,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
