import 'package:flutter/material.dart';
import 'package:template/Dentist/SearchLabsPage/model/search_lab_model.dart';
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
    final labs = [
      const SearchLabModel(
        name: 'مخبر هشام',
        city: 'دمشق',
        rating: 4.8,
      ),
      const SearchLabModel(
        name: 'مخبر الأسنان الرقمية',
        city: 'حمص',
        rating: 4.6,
      ),
      const SearchLabModel(
        name: 'مخبر الإبداع',
        city: 'حلب',
        rating: 4.4,
      ),
    ];

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
            child: Column(
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
                      '${labs.length} مخبر',
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
                    itemCount: labs.length,
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
                        lab: labs[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
