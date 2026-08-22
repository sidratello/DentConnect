import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_image.dart';
import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad_feed/AdImagesGalleryScreen.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';

class BlogDoctorPostDetailsImages
    extends StatefulWidget {
  final List<BlogPostAttachment>
      attachments;

  const BlogDoctorPostDetailsImages({
    super.key,
    required this.attachments,
  });

  @override
  State<BlogDoctorPostDetailsImages>
      createState() =>
          _BlogDoctorPostDetailsImagesState();
}

class _BlogDoctorPostDetailsImagesState
    extends State<BlogDoctorPostDetailsImages> {
  final PageController _pageController =
      PageController();

  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final attachments =
        widget.attachments;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(0.55),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.04),
            blurRadius: 12,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: PageView.builder(
              controller:
                  _pageController,
              itemCount:
                  attachments.length,
              onPageChanged: (
                index,
              ) {
                setState(() {
                  _selectedIndex =
                      index;
                });
              },
            itemBuilder: (
  context,
  index,
) {
  return InkWell(
    onTap: () {
      Get.to(
        () => AdImagesGalleryScreen(
          images: attachments
              .map(
                (attachment) =>
                    attachment.path,
              )
              .toList(),
          initialIndex: index,
        ),
      );
    },
    borderRadius:
        BorderRadius.circular(16),
    child: AppNetworkContentImage(
      imagePath:
          attachments[index].path,
      aspectRatio: 16 / 9,
      borderRadius: 16,
    ),
  );
},
            ),
          ),

          if (attachments.length > 1) ...[
            const SizedBox(height: 12),

            _ImagesIndicator(
              imagesCount:
                  attachments.length,
              selectedIndex:
                  _selectedIndex,
            ),

            const SizedBox(height: 8),

            Text(
              '${_selectedIndex + 1} من '
              '${attachments.length}',
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.normalText,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
class _ImagesIndicator
    extends StatelessWidget {
  final int imagesCount;
  final int selectedIndex;

  const _ImagesIndicator({
    required this.imagesCount,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: List.generate(
        imagesCount,
        (index) {
          final isSelected =
              index == selectedIndex;

          return AnimatedContainer(
            duration: const Duration(
              milliseconds: 220,
            ),
            width:
                isSelected ? 22 : 8,
            height: 8,
            margin:
                const EdgeInsets.symmetric(
              horizontal: 3,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryBlue
                  : AppColors.littleBlue,
              borderRadius:
                  BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}