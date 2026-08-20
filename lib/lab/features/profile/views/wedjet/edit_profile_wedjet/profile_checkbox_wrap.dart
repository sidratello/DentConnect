import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/profile_chexk_box.dart';
class ProfileCheckBoxWrap extends StatelessWidget {
  final List<String> items;
  final RxList<String> selectedItems;
  final Function(String) onTap;

  const ProfileCheckBoxWrap({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      alignment: WrapAlignment.start,
      children: items.map((item) {
        return Obx(() {
          return ProfileCheckBox(
            title: item,
            value: selectedItems.contains(item),
            onChanged: (_) => onTap(item),
          );
        });
      }).toList(),
    );
  }
}