import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core/utils/static.dart';

class ProfileHeader extends GetView<HomeController> {
  const ProfileHeader({super.key});

  ImageProvider getProfileImage() {
    final profilePictureUrl =
        controller.doctorProfileModel.value?.profilePictureUrl;

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
    const primary = Color(0xFF367AFF);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primary,
                width: 3,
              ),
              image: DecorationImage(
                image: getProfileImage(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "محمد أحمد علي",
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "طبيب أسنان",
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
