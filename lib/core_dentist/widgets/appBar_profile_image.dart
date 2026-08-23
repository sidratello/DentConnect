import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core_dentist/utils/static.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';

class AppbarProfileImage extends StatelessWidget {
  final bool isPreviewMode;

  const AppbarProfileImage({
    super.key,
    required this.isPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    if (isPreviewMode) {
      return _buildProfileImage(
        context,
        'assets/images/profile.png',
      );
    }

    return Obx(() {
      final profileImage =
          HomeController.to.doctorProfileModel.value?.profilePictureUrl;

      return _buildProfileImage(
        context,
        profileImage,
      );
    });
  }

  Widget _buildProfileImage(
    BuildContext context,
    String? imageUrlProfile,
  ) {
    final imageSize = Static.getwidth(context, 42);
    final borderSize = Static.getwidth(context, 2);

    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Container(
        width: imageSize,
        height: imageSize,
        padding: EdgeInsets.all(borderSize),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(101, 153, 255, 1),
        ),
        child: ClipOval(
          child: imageUrlProfile != null && imageUrlProfile.isNotEmpty
              ? Image.network(
                  '${Static.imageBaseUrl}/$imageUrlProfile',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return _buildDefaultImage();
                  },
                )
              : _buildDefaultImage(),
        ),
      ),
    );
  }

  Widget _buildDefaultImage() {
    return Image.asset(
      'assets/images/doctor_profile.png',
      fit: BoxFit.cover,
    );
  }
}
