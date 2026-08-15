import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/utils/static.dart';

class ImageItem extends StatelessWidget {
  final String image;
  final String heroTag;

  const ImageItem({
    super.key,
    required this.image,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: InteractiveViewer(
              minScale: 0.8,
              maxScale: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '${Static.imageBaseUrl}/$image',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
      child: Hero(
        tag: heroTag,
        child: Container(
          width: Static.getwidth(context, 110),
          height: Static.getheight(context, 110),
          margin: EdgeInsets.only(
            left: Static.getwidth(context, 12),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage('${Static.imageBaseUrl}/$image'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
