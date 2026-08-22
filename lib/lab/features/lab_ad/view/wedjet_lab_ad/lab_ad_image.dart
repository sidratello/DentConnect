// import 'package:flutter/material.dart';

// import 'package:template/core/app_colors.dart';
// import 'package:template/core/widgets/AppLoadingIndicator.dart';

// class AppNetworkContentImage extends StatelessWidget {
//   final String imagePath;
//   final int additionalImagesCount;

//   final double aspectRatio;
//   final double borderRadius;

//   const AppNetworkContentImage({
//     super.key,
//     required this.imagePath,
//     this.additionalImagesCount = 0,
//     this.aspectRatio = 16 / 8.5,
//     this.borderRadius = 16,
//   });

//   static const String _serverBaseUrl =
//       'http://192.168.1.3:44334/';

//   String get imageUrl {
//     final path = imagePath.trim();

//     if (path.startsWith('http://') ||
//         path.startsWith('https://')) {
//       return path;
//     }

//     final normalizedPath = path.startsWith('/')
//         ? path.substring(1)
//         : path;

//     return '$_serverBaseUrl$normalizedPath';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: aspectRatio,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(
//           borderRadius,
//         ),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             Image.network(
//               imageUrl,
//               fit: BoxFit.cover,
//               loadingBuilder: (
//                 context,
//                 child,
//                 loadingProgress,
//               ) {
//                 if (loadingProgress == null) {
//                   return child;
//                 }

//                 return Container(
//                   color: AppColors.grey200,
//                   alignment: Alignment.center,
//                   child: const AppLoadingIndicator(
//                     size: 28,
//                   ),
//                 );
//               },
//               errorBuilder: (
//                 context,
//                 error,
//                 stackTrace,
//               ) {
//                 return const _ImagePlaceholder();
//               },
//             ),
//             if (additionalImagesCount > 0)
//               Positioned(
//                 left: 12,
//                 bottom: 12,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 11,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(.65),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(
//                         Icons.photo_library_outlined,
//                         color: AppColors.white,
//                         size: 17,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         '+$additionalImagesCount',
//                         style: const TextStyle(
//                           color: AppColors.white,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ImagePlaceholder extends StatelessWidget {
//   const _ImagePlaceholder();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.grey200,
//       alignment: Alignment.center,
//       child: const Icon(
//         Icons.broken_image_outlined,
//         color: AppColors.grey600,
//         size: 38,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';

class AppNetworkContentImage extends StatelessWidget {
  final String? imagePath;
  final int additionalImagesCount;

  final double? width;
  final double? height;

  /// Used only when width/height are not provided.
  final double aspectRatio;

  final double borderRadius;
  final BoxFit fit;

  const AppNetworkContentImage({
    super.key,
    required this.imagePath,
    this.additionalImagesCount = 0,
    this.width,
    this.height,
    this.aspectRatio = 16 / 8.5,
    this.borderRadius = 16,
    this.fit = BoxFit.cover,
  });

  static const String _serverBaseUrl =
     'https://osnet.shop/dentconnect/';

  String? get imageUrl {
    final path = imagePath?.trim() ?? '';

    if (path.isEmpty) {
      return null;
    }

    if (path.startsWith('http://') ||
        path.startsWith('https://')) {
      return path;
    }

    final normalizedPath = path.startsWith('/')
        ? path.substring(1)
        : path;

    return '$_serverBaseUrl$normalizedPath';
  }

  @override
  Widget build(BuildContext context) {
    final imageContent = ClipRRect(
      borderRadius: BorderRadius.circular(
        borderRadius,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(),

          if (additionalImagesCount > 0)
            Positioned(
              left: 8,
              bottom: 8,
              child: _AdditionalImagesBadge(
                count: additionalImagesCount,
              ),
            ),
        ],
      ),
    );

    // إذا تم تحديد width أو height
    // نستخدم الحجم الثابت.
    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: imageContent,
      );
    }

    // وإلا نستخدم aspectRatio الافتراضي.
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: imageContent,
    );
  }

  Widget _buildImage() {
    final url = imageUrl;

    if (url == null) {
      return const _ImagePlaceholder();
    }

    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (
        context,
        child,
        loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        }

        return Container(
          color: AppColors.grey200,
          alignment: Alignment.center,
          child: const AppLoadingIndicator(
            size: 24,
            strokeWidth: 2,
            centered: false,
          ),
        );
      },
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return const _ImagePlaceholder();
      },
    );
  }
}

class _AdditionalImagesBadge
    extends StatelessWidget {
  final int count;

  const _AdditionalImagesBadge({
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.65),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.photo_library_outlined,
            color: AppColors.white,
            size: 15,
          ),
          const SizedBox(width: 4),
          Text(
            '+$count',
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePlaceholder
    extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.littleBlue.withOpacity(.25),
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_outlined,
        color: AppColors.primaryBlue,
        size: 32,
      ),
    );
  }
}