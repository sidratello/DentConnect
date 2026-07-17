import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../controller/search_labs_controller.dart';

class SearchLabTextField extends StatelessWidget {
  const SearchLabTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchLabsController>();

    return TextField(
      onChanged: (value) {
        controller.searchText.value = value;
      },
      decoration: InputDecoration(
        hintText: 'ابحث باسم المخبر',
        prefixIcon: const Icon(
          Icons.search_rounded,
        ),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(
        fontFamily: 'IBM Plex Sans Arabic',
        fontSize: Static.getwidth(context, 15),
      ),
    );
  }
}
