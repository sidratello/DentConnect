import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';

class DrawerHeaderWidget extends GetView<HomeController> {
  const DrawerHeaderWidget({
    super.key,
  });

  ImageProvider<Object> getProfileImage(String? profilePictureUrl) {
    if (profilePictureUrl != null && profilePictureUrl.isNotEmpty) {
      return NetworkImage(
        '${Static.imageBaseUrl}/$profilePictureUrl',
      );
    }

    return const AssetImage(
      'assets/images/doctor_profile.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final doctor = controller.doctorProfileModel.value;

      final doctorName = doctor?.name?.trim().isNotEmpty == true
          ? doctor!.name!
          : 'دكتور أسنان';

      return Column(
        children: [
          CircleAvatar(
            radius: Static.getwidth(context, 38),
            backgroundImage: getProfileImage(
              doctor?.profilePictureUrl,
            ),
          ),
          AppSpacing.height(context, 14),
          Text(
            doctorName,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(context, 18),
            ),
          ),
        ],
      );
    });
  }
}
