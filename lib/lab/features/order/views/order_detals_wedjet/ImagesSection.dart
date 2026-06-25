





import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/order/views/order_detals_wedjet/FilesSection.dart';
class ImagesSection extends StatelessWidget {
  final dynamic order;

  const ImagesSection({
    super.key,
    required this.order,
  });

  static const String baseUrl = 'http://192.168.1.10:44352/';

  @override
  Widget build(BuildContext context) {
    if (order.requiredImages.isEmpty) {
      return SectionBox(
        title: 'صور مرفقة',
        child: Text(
          'لا توجد صور',
          style: AppTextStyles.ibmRegular14NeutralStyle,
        ),
      );
    }

    return SectionBox(
      title: 'صور مرفقة',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: order.requiredImages.map<Widget>((imagePath) {
       

     final imageUrl = Uri.encodeFull('$baseUrl$imagePath');

debugPrint('IMAGE URL: $imageUrl');

          return GestureDetector(
            onTap:(){
                Get.dialog(
      Dialog(
        child: InteractiveViewer(
          child: Image.network(imageUrl),
        ),
      ),
    );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('IMAGE ERROR: $error');
                return const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('ERROR')),
                );
              },
            ),
            ),
          );
        }).toList(),
      ),
    );
  }
}