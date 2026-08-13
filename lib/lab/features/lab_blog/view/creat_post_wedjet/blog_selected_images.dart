// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:template/core/app_colors.dart';

// import '../../controller/create_blog_controller.dart';

// class BlogSelectedImages extends StatelessWidget {
//   const BlogSelectedImages({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller =
//         Get.find<CreateBlogController>();

//     return Obx(() {
//       if (controller.selectedImages.isEmpty) {
//         return const SizedBox.shrink();
//       }

//       return SizedBox(
//         height: 104,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemCount:
//               controller.selectedImages.length + 1,
//           separatorBuilder: (_, __) =>
//               const SizedBox(width: 10),
//           itemBuilder: (context, index) {
//             if (index ==
//                 controller.selectedImages.length) {
//               return _AddMoreImageButton(
//                 onTap: controller.pickImages,
//               );
//             }

//             return _SelectedImageItem(
//               file: controller.selectedImages[index],
//               onRemove: () {
//            controller.removeNewImage(index);
//               },
//             );
//           },
//         ),
//       );
//     });
//   }
// }

// class _SelectedImageItem extends StatelessWidget {
//   final File file;
//   final VoidCallback onRemove;

//   const _SelectedImageItem({
//     required this.file,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 104,
//       height: 104,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned.fill(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(13),
//               child: Image.file(
//                 file,
//                 fit: BoxFit.cover,
//                 errorBuilder: (_, __, ___) {
//                   return Container(
//                     color: AppColors.grey200,
//                     alignment: Alignment.center,
//                     child: const Icon(
//                       Icons.broken_image_outlined,
//                       color: AppColors.grey600,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             top: -5,
//             right: -5,
//             child: InkWell(
//               onTap: onRemove,
//               borderRadius: BorderRadius.circular(20),
//               child: Container(
//                 width: 25,
//                 height: 25,
//                 decoration: const BoxDecoration(
//                   color: Colors.black87,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.close_rounded,
//                   size: 17,
//                   color: AppColors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _AddMoreImageButton extends StatelessWidget {
//   final VoidCallback onTap;

//   const _AddMoreImageButton({
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(13),
//       child: Container(
//         width: 104,
//         height: 104,
//         decoration: BoxDecoration(
//           color:
//               AppColors.primaryBlue.withOpacity(.035),
//           borderRadius: BorderRadius.circular(13),
//           border: Border.all(
//             color:
//                 AppColors.primaryBlue.withOpacity(.55),
//           ),
//         ),
//         child: const Icon(
//           Icons.add_rounded,
//           color: AppColors.primaryBlue,
//           size: 34,
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';

class BlogSelectedImages
    extends StatelessWidget {
  final RxList<File> selectedImages;

  final Future<void> Function()
      onPickImages;

  final void Function(int index)
      onRemoveImage;

  const BlogSelectedImages({
    super.key,
    required this.selectedImages,
    required this.onPickImages,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (selectedImages.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 104,
          child: ListView.separated(
            scrollDirection:
                Axis.horizontal,
            itemCount:
                selectedImages.length + 1,
            separatorBuilder:
                (_, __) =>
                    const SizedBox(
              width: 10,
            ),
            itemBuilder: (
              context,
              index,
            ) {
              if (index ==
                  selectedImages.length) {
                return _AddMoreImageButton(
                  onTap: onPickImages,
                );
              }

              return _SelectedImageItem(
                file:
                    selectedImages[index],
                onRemove: () {
                  onRemoveImage(index);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _SelectedImageItem
    extends StatelessWidget {
  final File file;
  final VoidCallback onRemove;

  const _SelectedImageItem({
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      height: 104,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(13),
              child: Image.file(
                file,
                fit: BoxFit.cover,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return Container(
                    color:
                        AppColors.grey200,
                    alignment:
                        Alignment.center,
                    child: const Icon(
                      Icons
                          .broken_image_outlined,
                      color:
                          AppColors.grey600,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: -5,
            right: -5,
            child: InkWell(
              onTap: onRemove,
              borderRadius:
                  BorderRadius.circular(20),
              child: Container(
                width: 25,
                height: 25,
                decoration:
                    const BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  size: 17,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddMoreImageButton
    extends StatelessWidget {
  final Future<void> Function() onTap;

  const _AddMoreImageButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          BorderRadius.circular(13),
      child: Container(
        width: 104,
        height: 104,
        decoration: BoxDecoration(
          color: AppColors.primaryBlue
              .withOpacity(.035),
          borderRadius:
              BorderRadius.circular(13),
          border: Border.all(
            color: AppColors.primaryBlue
                .withOpacity(.55),
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          color: AppColors.primaryBlue,
          size: 34,
        ),
      ),
    );
  }
}