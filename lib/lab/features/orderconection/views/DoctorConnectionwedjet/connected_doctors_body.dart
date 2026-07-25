import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';

import 'package:template/core/widgets/CustomEmptyState.dart';
import 'package:template/lab/features/orderconection/views/DoctorConnectionwedjet/connected_doctor_card.dart';
import 'package:template/lab/features/orderconection/views/DoctorConnectionwedjet/disconnect_doctor_dialog.dart';

import '../../controller/connected_doctors_controller.dart';


class ConnectedDoctorsBody extends StatelessWidget {
  const ConnectedDoctorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConnectedDoctorsController>();

    return Obx(() {
      if (controller.isLoading.value) {
   return const AppLoadingIndicator();
      }

      if (controller.connectedDoctors.isEmpty) {
        final isSearching = controller.searchQuery.value.isNotEmpty;

        return CustomEmptyState(
          title: isSearching
              ? 'لا توجد نتائج بحث'
              : 'لا يوجد أطباء متصلون',
          subtitle: isSearching
              ? 'لم يتم العثور على طبيب  او عنوان مطابق لبيانات البحث.'
              : 'سيظهر الأطباء هنا بعد قبول طلبات الاتصال.',
          mainAxisAlignment: MainAxisAlignment.start,
        );
      }

      return RefreshIndicator(
        onRefresh: controller.getConnectedDoctors,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            20.w,
            10.h,
            20.w,
            30.h,
          ),
          itemCount: controller.connectedDoctors.length,
          itemBuilder: (context, index) {
            final doctor = controller.connectedDoctors[index];

            return ConnectedDoctorCard(
              doctor: doctor,
              onDisconnect: () {
                showDisconnectDoctorDialog(
                  context: context,
                  doctor: doctor,
                  controller: controller,
                );
              },
            );
          },
        ),
      );
    });
  }
}