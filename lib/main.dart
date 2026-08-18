import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/auth/local_notification_service.dart';


import 'package:template/core/app_router.dart';
import 'package:template/core/storage_services.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Get.putAsync<StorageService>(
    () async => await StorageService().init(),
  );


  await LocalNotificationService()
      .initialize();


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
            designSize: const Size(402, 1057),
      minTextAdapt: true,
      splitScreenMode: true,
          builder: (context, child) {
      return GetMaterialApp(
       locale: const Locale('ar'),
       supportedLocales: const [
    Locale('ar'),
    Locale('en'),
  ],

        getPages: AppRouter.pages,
        debugShowCheckedModeBanner: false,
         localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
      );}
    );
  }
}