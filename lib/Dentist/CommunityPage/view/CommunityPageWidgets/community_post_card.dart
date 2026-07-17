import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:template/Dentist/CommunityPage/view/CommunityPageWidgets/community_post_status_badge.dart';
import 'package:template/Dentist/CommunityPage/view/CommunityPageWidgets/post_details_page.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/widgets/app_spacing.dart';
import '../../../../core/utils/static.dart';
import '../../model/community_post_model.dart';

class CommunityPostCard extends StatelessWidget {
  final CommunityPostModel post;

  const CommunityPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Get.to(
          () => PostDetailsPage(post: post),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                Static.getwidth(context, 16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: Static.getwidth(context, 22),
                    backgroundImage: AssetImage(
                      post.doctorImage,
                    ),
                  ),
                  AppSpacing.width(context, 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.doctorName,
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w600,
                            fontSize: Static.getwidth(context, 16),
                          ),
                        ),
                        Text(
                          post.createdAt,
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w400,
                            fontSize: Static.getwidth(context, 12),
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommunityPostStatusBadge(
                    status: post.status,
                  ),
                ],
              ),
            ),
            if (post.images.isNotEmpty)
              SizedBox(
                height: Static.getheight(context, 240),
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: post.images.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          post.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black54,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                        child: Text(
                          '1 / ${post.images.length}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsets.all(
                Static.getwidth(context, 16),
              ),
              child: Text(
                post.content,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w400,
                  fontSize: Static.getwidth(context, 15),
                  height: 24 / 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
