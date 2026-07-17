import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core/app_router.dart';
import 'package:template/core/storage_services.dart';
import 'package:template/core/theme/app_theme.dart';
import 'package:template/core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  await Get.putAsync<StorageService>(
    () async => await StorageService().init(),
  );

  Get.put(HomeController());
  Get.put(ThemeController());

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
