import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CasesPage/controller/case_controller.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';
import 'package:template/Dentist/CreateOrderPage/model/compensation_data.dart';
import 'package:template/Dentist/CreateOrderPage/view/CreateOrderWidgets/Upload/upload_files_card.dart';
import 'package:template/Dentist/MainPage/view/main_page.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../Cards/order_details_card.dart';
import '../Shared/section_title.dart';
import 'tooth_item.dart';

class TeethSelector extends GetView<CreateOrderController> {
  const TeethSelector({
    super.key,
    this.onNext,
    this.isEditMode = false,
    this.orderId,
  });

  final VoidCallback? onNext;
  final bool isEditMode;
  final int? orderId;

  static const List<String> upperRight = [
    '18',
    '17',
    '16',
    '15',
    '14',
    '13',
    '12',
    '11',
  ];

  static const List<String> upperLeft = [
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
  ];

  static const List<String> lowerRight = [
    '48',
    '47',
    '46',
    '45',
    '44',
    '43',
    '42',
    '41',
  ];

  static const List<String> lowerLeft = [
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
  ];

  Widget buildRow(
    BuildContext context,
    List<String> teeth,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: teeth.map(
        (tooth) {
          return Obx(
            () => ToothItem(
              toothNumber: tooth,
              isSelected: controller.isCompensationToothSelected(tooth),
              onTap: () {
                controller.toggleCompensationTooth(tooth);
              },
            ),
          );
        },
      ).toList(),
    );
  }

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
          title: Text(
            'اختيار التعويض ',
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
            child: Column(
              children: [
                // --------------------------------------------------
                // Scrollable Content
                // --------------------------------------------------
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      20,
                      20,
                      20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --------------------------------------------------
                        // Header
                        // --------------------------------------------------
                        _buildHeader(context),

                        const SizedBox(height: 24),

                        // --------------------------------------------------
                        // Compensation Type
                        // --------------------------------------------------
                        const SectionTitle(
                          icon: Icons.medical_services_outlined,
                          title: 'نوع التعويض',
                        ),

                        const SizedBox(height: 14),

                        _buildCompensationField(context),

                        const SizedBox(height: 24),

                        // --------------------------------------------------
                        // Teeth
                        // --------------------------------------------------
                        const SectionTitle(
                          icon: Icons.grid_view_rounded,
                          title: 'الأسنان المطلوبة',
                        ),

                        const SizedBox(height: 14),

                        OrderDetailsCard(
                          child: Column(
                            children: [
                              buildRow(
                                context,
                                upperRight,
                              ),
                              const SizedBox(height: 12),
                              buildRow(
                                context,
                                upperLeft,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                child: const Divider(
                                  color: AppColors.border,
                                  height: 1,
                                ),
                              ),
                              buildRow(
                                context,
                                lowerRight,
                              ),
                              const SizedBox(height: 12),
                              buildRow(
                                context,
                                lowerLeft,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),

                        // --------------------------------------------------
                        // Selected Teeth
                        // --------------------------------------------------
                        Obx(
                          () {
                            if (controller.selectedCompensationTeeth.isEmpty) {
                              return const SizedBox();
                            }

                            return _buildSelectedTeeth(context);
                          },
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // --------------------------------------------------
                // Bottom Actions
                // --------------------------------------------------
                _buildBottomActions(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.primary.withOpacity(.12),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.auto_awesome_outlined,
              color: AppColors.primary,
              size: 25,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'حدد تفاصيل التعويض',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'اكتب نوع التعويض ثم اختر الأسنان المطلوبة',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompensationField(
    BuildContext context,
  ) {
    return DropdownButtonFormField<int>(
      initialValue: CompensationData.compensationTypes[0]['id'],
      isExpanded: true,
      decoration: InputDecoration(
        hintText: 'اختر نوع التعويض',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'IBM Plex Sans Arabic',
          fontSize: 12,
        ),
        prefixIcon: const Icon(
          Icons.medical_services_outlined,
          color: AppColors.primary,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primary.withValues(alpha: .18),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
      ),
      items: CompensationData.compensationTypes.map(
        (type) {
          return DropdownMenuItem<int>(
            value: type['id'] as int,
            child: Text(
              type['name'] as String,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          );
        },
      ).toList(),
      onChanged: (value) {
        if (value != null) {
          controller.selectCompensationType(value);
        }
      },
    );
  }

  Widget _buildSelectedTeeth(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: .15),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: AppColors.primary,
              size: 19,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.selectedCompensationTeeth.length} أسنان محددة',
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  controller.selectedCompensationTeeth.join(' • '),
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        20,
        14,
        20,
        14,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: AppColors.border.withOpacity(.7),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Add Compensation
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                controller.addCompensation(
                  orderId: isEditMode ? orderId : null,
                );
              },
              icon: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 20,
              ),
              label: const Text(
                'إضافة التعويض',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Next
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () async {
                if (!controller.addedCompensation) {
                  Get.snackbar(
                    'تنبيه',
                    'يرجى إضافة تعويض واحد على الأقل',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                if (isEditMode) {
                  controller.clearCompensationSelection();

                  Get.offAll(
                    () => MainPage(),
                  );

                  return;
                }

                // إنشاء طلب جديد
                if (controller.model.value.impressionType != 'digital') {
                  controller.resetOrder();

                  Get.offAll(
                    () => MainPage(),
                  );
                  final caseController = Get.find<CaseController>();
                  await caseController.fetchCases();
                } else {
                  Get.to(
                    () => const UploadFilesCard(),
                  );
                }
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 20,
              ),
              label: const Text(
                'الصفحة التالية',
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(
                  color: AppColors.primary,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
