import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:template/core/app_router.dart';
import 'package:template/core/storage_services.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Get.putAsync<StorageService>(
    () async => await StorageService().init(),
  );





  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRouter.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}