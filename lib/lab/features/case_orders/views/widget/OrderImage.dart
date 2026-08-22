import 'package:flutter/material.dart';
import 'package:template/core_dentist/utils/static.dart';

class OrderImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const OrderImage({
    super.key,
    required this.imagePath,
    this.width = 120,
    this.height = 125,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(18),
      child: imagePath.isEmpty
          ? Image.asset(
              'assets/images/toothdefult.png',
              width: width,
              height: height,
              fit: BoxFit.cover,
            )
          : Image.network(
              _fullImageUrl(imagePath),
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Image.asset(
                  'assets/images/toothdefult.png',
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                );
              },
            ),
    );
  }

  String _fullImageUrl(String path) {
    if (path.startsWith('http')) return path;
    return '${Static.imageBaseUrl}/$path';
  }
}
