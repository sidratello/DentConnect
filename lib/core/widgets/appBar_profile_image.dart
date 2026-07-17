import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class AppbarProfileImage extends StatelessWidget {
  final bool isPreviewMode;

  const AppbarProfileImage({
    super.key,
    required this.isPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: ClipOval(
        child: Image.asset(
          isPreviewMode
              ? 'assets/images/profile.png'
              : 'assets/images/doctor_profile.png',
          width: Static.getwidth(context, 42),
          height: Static.getwidth(context, 42),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
