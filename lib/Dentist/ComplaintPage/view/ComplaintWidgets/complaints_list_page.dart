import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/ComplaintPage/controller/complaints_list_controller.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_card.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../../../../core_dentist/utils/static.dart';

class ComplaintsListPage extends StatelessWidget {
  const ComplaintsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ComplaintsListController(),
    );

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
          centerTitle: true,
          actions: const [
            AppbarVectorBlack(),
          ],
          title: Text(
            'شكاواي',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(
                context,
                21,
              ),
            ),
          ),
        ),
        body: TopBackground(
          body: SafeArea(
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }

                if (controller.complaints.isEmpty) {
                  return const Center(
                    child: Text(
                      'لا توجد شكاوى',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontSize: 15,
                      ),
                    ),
                  );
                }

                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: controller.fetchComplaints,
                  child: ListView.separated(
                    padding: EdgeInsets.all(
                      Static.getwidth(
                        context,
                        20,
                      ),
                    ),
                    itemCount: controller.complaints.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      final complaint = controller.complaints[index];

                      return ComplaintCard(
                        complaint: complaint,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
