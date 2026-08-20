import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/lab/features/lab_ad/view/wedjet_lab_ad/lab_ad_image.dart';

class AdImagesGalleryScreen
    extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const AdImagesGalleryScreen({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  State<AdImagesGalleryScreen>
      createState() =>
          _AdImagesGalleryScreenState();
}

class _AdImagesGalleryScreenState
    extends State<AdImagesGalleryScreen> {
  late int currentIndex;

  late final PageController
      pageController;

  @override
  void initState() {
    super.initState();

    currentIndex =
        widget.initialIndex;

    pageController =
        PageController(
      initialPage:
          widget.initialIndex,
    );
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller:
                  pageController,
              itemCount:
                  widget.images.length,

              onPageChanged:
                  (index) {
                setState(() {
                  currentIndex =
                      index;
                });
              },

              itemBuilder: (
                context,
                index,
              ) {
                return Center(
                  child:
                      AppNetworkContentImage(
                    imagePath:
                        widget.images[
                            index],
                    aspectRatio: 1,
                    borderRadius: 0,
                    fit:
                        BoxFit.contain,
                  ),
                );
              },
            ),

            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                onPressed:
                    Get.back,
                icon:
                    const Icon(
                  Icons
                      .close_rounded,
                  color:
                      Colors.white,
                  size: 28,
                ),
              ),
            ),

            if (widget
                    .images.length >
                1)
              Positioned(
                bottom: 24,
                left: 0,
                right: 0,
                child: Text(
                  '${currentIndex + 1} / ${widget.images.length}',
                  textAlign:
                      TextAlign.center,
                  style:
                      const TextStyle(
                    color:
                        Colors.white,
                    fontSize: 16,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}