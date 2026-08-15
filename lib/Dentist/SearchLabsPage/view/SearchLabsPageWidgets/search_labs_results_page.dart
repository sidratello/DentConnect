import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/Dentist/SearchLabsPage/view/SearchLabsPageWidgets/search_result_lab_card.dart';
import 'package:template/core/utils/static.dart';
import 'package:template/core/widgets/appbar_vector_black.dart';
import 'package:template/core/widgets/top_background.dart';

import '../../../../core/theme/app_colors.dart';

class SearchLabsResultsPage extends StatelessWidget {
  const SearchLabsResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 250, 255, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        elevation: 0,
        surfaceTintColor: AppColors.surfaceTintColor,
        centerTitle: true,
        title: Text(
          'نتائج البحث',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: const [AppbarVectorBlack()],
      ),
      body: TopBackground(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(
                context,
                24,
              ),
            ),
            child: Obx(() {
              return Column(
                children: [
                  SizedBox(
                    height: Static.getheight(
                      context,
                      8,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.searchLab.length} مخبر',
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.sort_rounded,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Static.getheight(
                      context,
                      16,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: controller.searchLab.length,
                      separatorBuilder: (_, __) => SizedBox(
                        height: Static.getheight(
                          context,
                          12,
                        ),
                      ),
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return SearchResultLabCard(
                          lab: controller.searchLab[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
