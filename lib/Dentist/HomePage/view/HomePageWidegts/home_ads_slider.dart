import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/HomePage/view/HomePageWidegts/advertisement_details_page.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class HomeAdsSlider extends StatelessWidget {
  const HomeAdsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Obx(() {
      if (homeController.advertisements.isEmpty) {
        return Center(
          child: Text(
            'لا توجد إعلانات متاحة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w500,
              fontSize: Static.getwidth(context, 14),
              color: AppColors.black54,
            ),
          ),
        );
      }

      return Column(
        children: [
          SizedBox(
            width: Static.getwidth(context, 380),
            height: Static.getheight(context, 180),
            child: PageView.builder(
              controller: homeController.adsPageController,
              itemCount: homeController.advertisements.length,
              onPageChanged: (index) {
                homeController.currentAdIndex.value = index;
              },
              itemBuilder: (_, index) {
                final ad = homeController.advertisements[index];

                return _buildAdCard(
                  context,
                  ad,
                );
              },
            ),
          ),
          SizedBox(
            height: Static.getheight(context, 12),
          ),
          _buildPageIndicators(
            context,
            homeController,
          ),
        ],
      );
    });
  }

  Widget _buildAdCard(
    BuildContext context,
    dynamic ad,
  ) {
    final String? imagePath =
        ad.images != null && ad.images!.isNotEmpty ? ad.images!.first : null;

    return GestureDetector(
      onTap: () {
        Get.to(
          () => AdvertisementDetailsPage(
            advertisement: ad,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildAdImage(
              context,
              imagePath,
            ),

            // Gradient حتى يضل النص واضح فوق الصورة.
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.25,
                    1.0,
                  ],
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.70),
                  ],
                ),
              ),
            ),

            Positioned(
              right: Static.getwidth(context, 18),
              left: Static.getwidth(context, 18),
              bottom: Static.getheight(context, 16),
              child: _buildAdPreview(
                context,
                ad,
              ),
            ),

            // مؤشر صغير يدل أن الإعلان قابل للفتح.
            Positioned(
              top: Static.getheight(context, 12),
              left: Static.getwidth(context, 12),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Static.getwidth(context, 9),
                  vertical: Static.getheight(context, 5),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(
                    alpha: 0.35,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.open_in_new_rounded,
                      color: Colors.white,
                      size: 13,
                    ),
                    SizedBox(
                      width: Static.getwidth(context, 4),
                    ),
                    Text(
                      'عرض التفاصيل',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: Static.getwidth(context, 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdImage(
    BuildContext context,
    String? imagePath,
  ) {
    final size = Size(
      Static.getwidth(context, 380),
      Static.getheight(context, 180),
    );

    if (imagePath == null || imagePath.isEmpty) {
      return Container(
        width: size.width,
        height: size.height,
        color: Colors.grey.shade200,
        child: Icon(
          Icons.image_outlined,
          size: Static.getwidth(context, 40),
          color: AppColors.black54,
        ),
      );
    }

    return Image.network(
      '${Static.imageBaseUrl}/$imagePath',
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
      loadingBuilder: (
        context,
        child,
        loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        }

        return Container(
          width: size.width,
          height: size.height,
          color: Colors.grey.shade100,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ),
          ),
        );
      },
      errorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return Container(
          width: size.width,
          height: size.height,
          color: Colors.grey.shade200,
          child: Icon(
            Icons.broken_image_outlined,
            size: Static.getwidth(context, 40),
            color: AppColors.black54,
          ),
        );
      },
    );
  }

  Widget _buildAdPreview(
    BuildContext context,
    dynamic ad,
  ) {
    final title = ad.title?.toString() ?? '';
    final content = ad.content?.toString() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 18),
              fontFamily: 'IBM Plex Sans Arabic',
              height: 1.4,
            ),
          ),
        if (title.isNotEmpty && content.isNotEmpty)
          SizedBox(
            height: Static.getheight(context, 4),
          ),
        if (content.isNotEmpty)
          Text(
            content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withValues(
                alpha: 0.90,
              ),
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 12.5),
              fontFamily: 'IBM Plex Sans Arabic',
              height: 1.5,
            ),
          ),
      ],
    );
  }

  Widget _buildPageIndicators(
    BuildContext context,
    HomeController controller,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.advertisements.length,
        (index) {
          final isSelected = controller.currentAdIndex.value == index;

          return AnimatedContainer(
            duration: const Duration(
              milliseconds: 250,
            ),
            curve: Curves.easeOut,
            margin: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 4),
            ),
            width: isSelected
                ? Static.getwidth(context, 18)
                : Static.getwidth(context, 8),
            height: Static.getheight(context, 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: AppColors.primary.withValues(
                      alpha: 0.20,
                    ),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
