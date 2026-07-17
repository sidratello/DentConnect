import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:template/Dentist/CommunityPage/controller/community_controller.dart';
import 'package:template/Dentist/CommunityPage/model/community_post_model.dart';
import 'package:template/Dentist/CommunityPage/view/CommunityPageWidgets/community_post_card.dart';
import 'package:template/Dentist/CommunityPage/view/CommunityPageWidgets/community_preview_card.dart';
import 'package:template/Dentist/CommunityPage/view/CommunityPageWidgets/community_tabs.dart';
import 'package:template/Dentist/CommunityPage/view/CommunityPageWidgets/create_post_button.dart';
import 'package:template/Dentist/CommunityPage/view/CommunityPageWidgets/create_post_page.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/app_spacing.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';

import '../../HomePage/controller/home_controller.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final allPosts = [
      const CommunityPostModel(
        doctorName: 'د. أحمد محمد',
        doctorImage: 'assets/images/doctor_profile.png',
        content:
            'مشاركة حالة تجميلية باستخدام الفينير مع المحافظة على البنية الطبيعية للأسنان وتحقيق أفضل نتيجة جمالية ممكنة للمريض.',
        images: [
          'assets/images/case_image.png',
          'assets/images/case_image.png',
        ],
        createdAt: 'منذ ساعتين',
        status: PostStatus.approved,
      ),
      const CommunityPostModel(
        doctorName: 'د. محمد علي',
        doctorImage: 'assets/images/doctor_profile.png',
        content:
            'معلومة سريعة حول اختيار درجة اللون المناسبة قبل تنفيذ التعويضات الثابتة.',
        images: [
          'assets/images/case_image.png',
        ],
        createdAt: 'منذ يوم',
        status: PostStatus.approved,
      ),
      const CommunityPostModel(
        doctorName: 'د. سامر أحمد',
        doctorImage: 'assets/images/doctor_profile.png',
        content:
            'استخدام الصور قبل وبعد العلاج يساعد المريض على فهم الخطة العلاجية بشكل أفضل.',
        images: [
          'assets/images/case_image.png',
        ],
        createdAt: 'منذ 3 أيام',
        status: PostStatus.approved,
      ),
    ];
    final myPosts = [
      const CommunityPostModel(
        doctorName: 'د. أحمد محمد',
        doctorImage: 'assets/images/doctor_profile.png',
        content: 'مشاركة حالة خزفية جديدة بانتظار مراجعة الإدارة.',
        images: [
          'assets/images/case_image.png',
        ],
        createdAt: 'منذ 10 دقائق',
        status: PostStatus.pending,
      ),
      const CommunityPostModel(
        doctorName: 'د. أحمد محمد',
        doctorImage: 'assets/images/doctor_profile.png',
        content: 'تم قبول هذا المنشور ونشره في المدونة العامة.',
        images: [
          'assets/images/case_image.png',
        ],
        createdAt: 'منذ يوم',
        status: PostStatus.approved,
      ),
      const CommunityPostModel(
        doctorName: 'د. أحمد محمد',
        doctorImage: 'assets/images/doctor_profile.png',
        content: 'تم رفض هذا المنشور لعدم اكتمال المعلومات المرفقة.',
        images: [
          'assets/images/case_image.png',
        ],
        createdAt: 'منذ أسبوع',
        status: PostStatus.rejected,
      ),
    ];
    final controller = Get.put(CommunityController());
    final appModeController = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        title: Text(
          ' المدونة العامة',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [AppbarVectorBlack()],
      ),
      body: TopBackground(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => appModeController.isPreviewMode.value
                  ? const Center(
                      child: CommunityPreviewCard(),
                    )
                  : Column(
                      children: [
                        CreatePostButton(
                          onTap: () {
                            Get.to(() => const CreatePostPage());
                          },
                        ),
                        SizedBox(
                          height: Static.getheight(context, 16),
                        ),
                        const CommunityTabs(),
                        AppSpacing.height(context, 12),
                        Expanded(
                          child: Obx(
                            () {
                              final displayedPosts =
                                  controller.selectedTab.value == 0
                                      ? allPosts
                                      : myPosts;
                              return ListView.separated(
                                itemCount: displayedPosts.length,
                                separatorBuilder: (_, __) =>
                                    AppSpacing.height(context, 16),
                                itemBuilder: (context, index) {
                                  return CommunityPostCard(
                                    post: displayedPosts[index],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
