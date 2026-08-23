import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/Dentist/ScannerAppointmentsPage/controller/scanner_appointments_controller.dart';
import 'package:template/Dentist/ScannerAppointmentsPage/view/scanner_appointment_card.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../../../core_dentist/theme/app_colors.dart';
import '../../../core_dentist/utils/static.dart';

class ScannerAppointmentsPage extends GetView<ScannerAppointmentsController> {
  const ScannerAppointmentsPage({
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
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: const [
            AppbarVectorBlack(),
          ],
          title: Text(
            'مواعيد الماسح',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
            ),
          ),
        ),
        body: TopBackground(
          body: SafeArea(
            child: Obx(
              () {
                if (controller.isLoading.value &&
                    controller.appointments.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }

                if (controller.errorMessage.isNotEmpty &&
                    controller.appointments.isEmpty) {
                  return _ErrorState(
                    message: controller.errorMessage.value,
                    onRetry: controller.fetchAppointments,
                  );
                }

                if (controller.appointments.isEmpty) {
                  return const _EmptyState();
                }

                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: controller.fetchAppointments,
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                      Static.getwidth(context, 20),
                      Static.getheight(context, 20),
                      Static.getwidth(context, 20),
                      30,
                    ),
                    itemCount: controller.appointments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final appointment = controller.appointments[index];
                      return ScannerAppointmentCard(
                        appointment: appointment,
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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: 0.08,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.primary,
                size: 36,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'لا توجد مواعيد محجوزة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ستظهر هنا مواعيد الماسح المتنقل التي قمت بحجزها.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 12,
                height: 1.6,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.redAccent,
              size: 48,
            ),
            const SizedBox(height: 12),
            const Text(
              'تعذر تحميل المواعيد',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
              ),
              child: const Text(
                'إعادة المحاولة',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
