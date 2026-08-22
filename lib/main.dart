import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/TemplatesPage/controller/template_controller.dart';
import 'package:template/core/storage_services.dart';
import 'package:template/core_dentist/theme/app_theme.dart';
import 'package:template/core_dentist/theme/theme_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:template/auth/local_notification_service.dart';
import 'package:template/auth/notification_service.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_router.dart';

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

  Get.put(ThemeController());
  Get.put(TemplateController());

  await GetStorage.init();
  await LocalNotificationService().initialize();
  final token =
      StorageService.to.read<String>(
    'token',
  );

  if (token != null &&
      token.trim().isNotEmpty) {
    AppHelper.token = token;

    await NotificationService()
        .startConnection(
      token,
    );
  }
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
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
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
