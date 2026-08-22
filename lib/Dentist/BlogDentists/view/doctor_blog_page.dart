import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/app_router.dart';

import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

class DoctorBlogPage extends StatelessWidget {
  const DoctorBlogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceTintColor,
          surfaceTintColor: AppColors.surfaceTintColor,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: const [
            AppbarVectorBlack(),
          ],
          title: Text(
            'المدونة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
        body: TopBackground(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 20),
                vertical: Static.getheight(context, 20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SizedBox(
                    height: Static.getheight(context, 24),
                  ),
                  _buildPublicBlogCard(context),
                  SizedBox(
                    height: Static.getheight(context, 16),
                  ),
                  _buildMyPostsCard(context),
                  SizedBox(
                    height: Static.getheight(context, 24),
                  ),
                  _buildFooterHint(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 20),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: .78),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(
              alpha: .18,
            ),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: .16,
              ),
              borderRadius: BorderRadius.circular(17),
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: 29,
            ),
          ),
          SizedBox(
            width: Static.getwidth(context, 14),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'مساحتك المعرفية',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'اكتشف المعرفة وشارك خبرتك مع مجتمع الأطباء',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 11.5,
                    height: 1.6,
                    color: Colors.white.withValues(
                      alpha: .88,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Public Blog
  // ============================================================

  Widget _buildPublicBlogCard(
    BuildContext context,
  ) {
    return _BlogOptionCard(
      icon: Icons.public_rounded,
      iconColor: AppColors.primary,
      title: 'المدونة العامة',
      description:
          'تصفح المنشورات والمقالات الطبية، واستفد من خبرات الأطباء الآخرين.',
      features: const [
        'تصفح جميع المنشورات',
        'قراءة المقالات والخبرات',
        'إضافة منشور جديد',
      ],
      buttonText: 'تصفح المدونة',
      onTap: () {
        Get.toNamed(
          AppRouter.blogdoctorFeed,
        );
      },
    );
  }

  // ============================================================
  // My Posts
  // ============================================================

  Widget _buildMyPostsCard(
    BuildContext context,
  ) {
    return _BlogOptionCard(
      icon: Icons.article_rounded,
      iconColor: const Color(0xFF6C63FF),
      title: 'منشوراتي',
      description: 'تابع منشوراتك الخاصة واعرف حالة كل منشور قمت بإرساله.',
      features: const [
        'عرض منشوراتك الخاصة',
        'متابعة حالة المنشور',
        'مراجعة المنشورات السابقة',
      ],
      buttonText: 'عرض منشوراتي',
      onTap: () {
        Get.toNamed(
          AppRouter.penndingdoctorPosts,
        );
      },
    );
  }

  // ============================================================
  // Footer
  // ============================================================

  Widget _buildFooterHint(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(
          alpha: .72,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primary.withValues(
            alpha: .08,
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lightbulb_outline_rounded,
            size: 19,
            color: AppColors.primary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'شارك معرفتك وخبرتك لتساهم في إثراء المحتوى الطبي.',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 11,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Reusable Blog Option Card
// ============================================================

class _BlogOptionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final List<String> features;
  final String buttonText;
  final VoidCallback onTap;

  const _BlogOptionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.features,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: iconColor.withValues(
            alpha: .10,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: .035,
            ),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 49,
                height: 49,
                decoration: BoxDecoration(
                  color: iconColor.withValues(
                    alpha: .09,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 25,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 15,
                color: Colors.grey.shade400,
              ),
            ],
          ),

          const SizedBox(height: 13),

          // Description
          Text(
            description,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: 11.5,
              height: 1.7,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 15),

          // Features
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: iconColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 9),
                  Text(
                    feature,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Button
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: iconColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_back_rounded,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
