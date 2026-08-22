import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/LabDetailsPage/model/lab_model.dart';
import 'package:template/core_dentist/utils/static.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../LabDetailsPage/view/lab_details_page.dart';

class LabsListView extends StatelessWidget {
  const LabsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final appModeController = Get.find<HomeController>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
      child: Obx(
        () => appModeController.labsDetails.isEmpty
            ? Center(
                child: Text(
                  'لا توجد مخابر متاحة',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontWeight: FontWeight.w500,
                    fontSize: Static.getwidth(context, 14),
                    color: AppColors.black54,
                  ),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: appModeController.labsDetails.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Static.getwidth(context, 12),
                  mainAxisSpacing: Static.getheight(context, 14),
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return LabCard(
                    labId: appModeController.labsDetails[index].id,
                    isFollowing: index.isEven,
                    isPreviewMode: appModeController.isPreviewMode.value,
                    labDetails: appModeController.labsDetails[index],
                  );
                },
              ),
      ),
    );
  }
}

class LabCard extends StatelessWidget {
  final bool isFollowing;
  final int labId;
  final bool isPreviewMode;
  final LabModel labDetails;

  const LabCard({
    super.key,
    required this.isFollowing,
    required this.isPreviewMode,
    required this.labId,
    required this.labDetails,
  });

  String? getLabDetailsImage(
    LabModel labDetails,
  ) {
    if (labDetails.profilePictureUrl != null &&
        labDetails.profilePictureUrl!.isNotEmpty) {
      return '${Static.imageBaseUrl}/${labDetails.profilePictureUrl!}';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to(
                () => LabDetailsPage(id: labId),
                arguments: labId,
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: getLabDetailsImage(labDetails) != null
                  ? Image.network(
                      getLabDetailsImage(labDetails)!,
                      width: double.infinity,
                      height: Static.getheight(context, 110),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/lab_card.png',
                      width: double.infinity,
                      height: Static.getheight(context, 110),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 10),
              vertical: Static.getheight(context, 10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      labDetails.name.toString(),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w500,
                        fontSize: Static.getwidth(context, 12),
                        color: AppColors.black54,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          labDetails.averageRating.toString(),
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w500,
                            fontSize: Static.getwidth(context, 13),
                          ),
                        ),
                        SizedBox(
                          width: Static.getwidth(context, 2),
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: AppColors.yellowRate,
                          size: Static.getwidth(context, 18),
                        ),
                      ],
                    ),
                  ],
                ),
                if (!isPreviewMode) ...[
                  SizedBox(
                    height: Static.getheight(context, 18),
                  ),
                  InkWell(
                    // onTap: () {
                    //   homeController.sendFollowRequest(labId);
                    // },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: Static.getheight(context, 9),
                      ),
                      decoration: BoxDecoration(
                        color: labDetails.isConnected == true
                            ? AppColors.boxGreen
                            : AppColors.boxBlack,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: labDetails.isConnected == true
                              ? AppColors.success
                              : AppColors.primary,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            labDetails.isConnected == true
                                ? Icons.check_rounded
                                : Icons.person_add_alt_1_rounded,
                            color: labDetails.isConnected == true
                                ? AppColors.success
                                : AppColors.primary,
                            size: Static.getwidth(context, 18),
                          ),
                          SizedBox(
                            width: Static.getwidth(context, 6),
                          ),
                          Text(
                            labDetails.isConnected == true ? 'متابع' : 'متابعة',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans Arabic',
                              fontWeight: FontWeight.w500,
                              fontSize: Static.getwidth(context, 13),
                              color: labDetails.isConnected == true
                                  ? AppColors.success
                                  : AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
