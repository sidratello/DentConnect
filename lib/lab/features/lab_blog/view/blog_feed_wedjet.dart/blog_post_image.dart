// import 'package:flutter/material.dart';

// import 'package:template/core/app_colors.dart';
// import 'package:template/core/widgets/AppLoadingIndicator.dart';
// import 'package:template/lab/features/lab_blog/model/post_model.dart';


// class BlogPostImage
//     extends StatelessWidget {
//   final BlogPostAttachment attachment;
//   final int additionalImagesCount;

//   const BlogPostImage({
//     super.key,
//     required this.attachment,
//     required this.additionalImagesCount,
//   });

//   static const String _serverBaseUrl =
//       'http://192.168.1.3:44334/';

//   String get imageUrl {
//     final path = attachment.path.trim();

//     if (path.startsWith('http://') ||
//         path.startsWith('https://')) {
//       return path;
//     }

//     final normalizedPath =
//         path.startsWith('/')
//             ? path.substring(1)
//             : path;

//     return '$_serverBaseUrl$normalizedPath';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 16 / 8.5,
//       child: ClipRRect(
//         borderRadius:
//             BorderRadius.circular(16),
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
//                   alignment:
//                       Alignment.center,
//                   child:
//                       const AppLoadingIndicator(
//                     size: 28,
//                   ),
//                 );
//               },
//               errorBuilder: (
//                 context,
//                 error,
//                 stackTrace,
//               ) {
//                 return Container(
//                   color: AppColors.grey200,
//                   alignment:
//                       Alignment.center,
//                   child: const Icon(
//                     Icons
//                         .broken_image_outlined,
//                     color: AppColors.grey600,
//                     size: 38,
//                   ),
//                 );
//               },
//             ),
//             if (additionalImagesCount > 0)
//               Positioned(
//                 left: 12,
//                 bottom: 12,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(
//                     horizontal: 11,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.black
//                         .withOpacity(.65),
//                     borderRadius:
//                         BorderRadius.circular(
//                       20,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisSize:
//                         MainAxisSize.min,
//                     children: [
//                       const Icon(
//                         Icons
//                             .photo_library_outlined,
//                         color: Colors.white,
//                         size: 17,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         '+$additionalImagesCount',
//                         style:
//                             const TextStyle(
//                           color: Colors.white,
//                           fontWeight:
//                               FontWeight.w700,
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


import 'package:flutter/material.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_image.dart';

import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogPostImage extends StatelessWidget {
  final BlogPostAttachment attachment;
  final int additionalImagesCount;

  const BlogPostImage({
    super.key,
    required this.attachment,
    required this.additionalImagesCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppNetworkContentImage(
      imagePath: attachment.path,
      additionalImagesCount: additionalImagesCount,
    );
  }
}