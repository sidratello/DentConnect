import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/SearchLabsPage/view/SearchLabsPageWidgets/search_labs_results_page.dart';
import 'package:template/core/widgets/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class SearchActionButtons extends StatelessWidget {
  const SearchActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () async {
              final success = await controller.fetchLabSearchResult(
                controller.searchText.value,
              );
              if (!success) return;
              if (controller.searchLab.isEmpty) {
                Get.snackbar(
                  'لا توجد نتائج',
                  'لم يتم العثور على أي مخبر',
                );
                return;
              }
              Get.to(
                () => const SearchLabsResultsPage(),
              );
            },
            child: Container(
              height: Static.getheight(context, 52),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: AppColors.white,
                      size: Static.getwidth(context, 20),
                    ),
                    AppSpacing.width(context, 12),
                    Text(
                      'عرض النتائج',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans Arabic',
                        fontWeight: FontWeight.w600,
                        fontSize: Static.getwidth(context, 16),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
