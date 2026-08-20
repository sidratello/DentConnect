import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/PatientPage/view/PatientPageWidgets/patient_case_card.dart';
import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../controller/patient_controller.dart';

class PatientCasesSection extends GetView<PatientController> {
  const PatientCasesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final cases = controller.cases.value?.data ?? [];

      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          Static.getwidth(
            context,
            18,
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            18,
          ),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(
              context,
              cases.length,
            ),
            SizedBox(
              height: Static.getheight(
                context,
                16,
              ),
            ),
            if (controller.isLoading.value)
              _buildLoading(context)
            else if (cases.isEmpty)
              _buildEmptyState(context)
            else
              ...cases.map(
                (caseItem) => Padding(
                  padding: EdgeInsets.only(
                    bottom: Static.getheight(
                      context,
                      12,
                    ),
                  ),
                  child: PatientCaseCard(
                    caseItem: caseItem,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildHeader(
    BuildContext context,
    int count,
  ) {
    return Row(
      children: [
        Container(
          width: Static.getwidth(
            context,
            42,
          ),
          height: Static.getheight(
            context,
            42,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(
              alpha: 0.10,
            ),
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Icon(
            Icons.folder_copy_outlined,
            color: AppColors.primary,
            size: Static.getwidth(
              context,
              21,
            ),
          ),
        ),
        SizedBox(
          width: Static.getwidth(
            context,
            10,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الحالات المشتركة',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w600,
                  fontSize: Static.getwidth(
                    context,
                    17,
                  ),
                ),
              ),
              SizedBox(
                height: Static.getheight(
                  context,
                  2,
                ),
              ),
              Text(
                count == 0
                    ? 'لا توجد حالات مسجلة'
                    : '$count حالات مشتركة مع المريض',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w400,
                  fontSize: Static.getwidth(
                    context,
                    11,
                  ),
                  color: AppColors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoading(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(
          context,
          25,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Static.getheight(
          context,
          28,
        ),
        horizontal: Static.getwidth(
          context,
          16,
        ),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(
          14,
        ),
        border: Border.all(
          color: AppColors.border.withValues(
            alpha: 0.7,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: Static.getwidth(
              context,
              52,
            ),
            height: Static.getheight(
              context,
              52,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: 0.08,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.folder_open_outlined,
              color: AppColors.primary.withValues(
                alpha: 0.65,
              ),
              size: Static.getwidth(
                context,
                25,
              ),
            ),
          ),
          SizedBox(
            height: Static.getheight(
              context,
              12,
            ),
          ),
          Text(
            'لا توجد طلبيات سابقة',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w600,
              fontSize: Static.getwidth(
                context,
                14,
              ),
              color: const Color(0xFF333333),
            ),
          ),
          SizedBox(
            height: Static.getheight(
              context,
              5,
            ),
          ),
          Text(
            'لا توجد حالات مشتركة مسجلة بين الطبيب والمريض حتى الآن.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(
                context,
                11,
              ),
              color: AppColors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
