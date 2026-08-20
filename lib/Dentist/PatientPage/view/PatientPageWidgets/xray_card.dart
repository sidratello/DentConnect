import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';

class XrayCard extends StatelessWidget {
  final String imagePath;

  const XrayCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(
          context,
          18,
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          18,
        ),
        border: Border.all(
          color: const Color.fromRGBO(
            228,
            233,
            243,
            1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'صورة الأشعة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(
                context,
                17,
              ),
            ),
          ),
          SizedBox(
            height: Static.getheight(
              context,
              14,
            ),
          ),
          InkWell(
            onTap: () {
              Get.dialog(
                Dialog(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                14,
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: Static.getheight(
                  context,
                  220,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
