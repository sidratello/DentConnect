import 'package:flutter/material.dart';

import 'package:template/Dentist/HomePage/model/advertisement_model.dart';

import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';

class AdvertisementDetailsPage extends StatelessWidget {
  final AdvertisementModel advertisement;

  const AdvertisementDetailsPage({
    super.key,
    required this.advertisement,
  });

  @override
  Widget build(BuildContext context) {
    final images = advertisement.images ?? <String>[];
    final content = advertisement.content ?? '';
    final title = advertisement.title ?? '';
    final expiresAt = advertisement.expiresAt;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: const [
            AppbarVectorBlack(),
          ],
          title: Text(
            'تفاصيل الإعلان',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 21),
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Advertisement Images
                _buildImages(
                  context,
                  images,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Static.getwidth(context, 20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Static.getheight(context, 22),
                      ),

                      // Advertisement Title
                      if (title.isNotEmpty)
                        Text(
                          title,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w700,
                            fontSize: Static.getwidth(context, 22),
                            height: 1.5,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),

                      SizedBox(
                        height: Static.getheight(context, 16),
                      ),

                      // Full Advertisement Content
                      if (content.isNotEmpty)
                        _buildInfoSection(
                          context,
                          content,
                        ),

                      SizedBox(
                        height: Static.getheight(context, 20),
                      ),

                      // Expiration Date
                      if (expiresAt != null && expiresAt.isNotEmpty)
                        _buildExpirationSection(
                          context,
                          expiresAt,
                        ),

                      SizedBox(
                        height: Static.getheight(context, 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // Images
  // ------------------------------------------------------------

  Widget _buildImages(
    BuildContext context,
    List<String> images,
  ) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: Static.getheight(context, 250),
      width: double.infinity,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (_, index) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
            child: Image.network(
              '${Static.imageBaseUrl}/${images[index]}',
              width: double.infinity,
              height: Static.getheight(context, 250),
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
                  color: Colors.grey.shade100,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: Static.getwidth(context, 40),
                    color: AppColors.black54,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // ------------------------------------------------------------
  // Full Content
  // ------------------------------------------------------------

  Widget _buildInfoSection(
    BuildContext context,
    String content,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: 0.10,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        content,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: FontWeight.w400,
          fontSize: Static.getwidth(context, 14),
          height: 2,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // Expiration Date
  // ------------------------------------------------------------

  Widget _buildExpirationSection(
    BuildContext context,
    String expiresAt,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(
          alpha: 0.05,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: 0.08,
          ),
        ),
      ),
      child: _buildInfoRow(
        context,
        icon: Icons.event_outlined,
        title: 'صالح حتى',
        value: _formatDate(expiresAt),
      ),
    );
  }

  // ------------------------------------------------------------
  // Information Row
  // ------------------------------------------------------------

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          width: Static.getwidth(context, 42),
          height: Static.getwidth(context, 42),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(
              alpha: 0.10,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: Static.getwidth(context, 21),
          ),
        ),
        SizedBox(
          width: Static.getwidth(context, 12),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w500,
              fontSize: Static.getwidth(context, 13),
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 13),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // Date Formatting
  // ------------------------------------------------------------

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return '-';
    }

    try {
      final parsedDate = DateTime.parse(date);

      return '${parsedDate.day}/'
          '${parsedDate.month}/'
          '${parsedDate.year}';
    } catch (_) {
      return date;
    }
  }
}
