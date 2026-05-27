import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core/utils/static.dart';

class LabsSectionHeader extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const LabsSectionHeader({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appModeController = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: appModeController.isPreviewMode ? 0.5 : 1,
            child: IgnorePointer(
              ignoring: appModeController.isPreviewMode,
              child: Container(
                width: Static.getwidth(context, 240),
                decoration: BoxDecoration(
                  color: appModeController.isPreviewMode
                      ? Colors.grey.shade300
                      : const Color.fromRGBO(239, 242, 249, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTab(
                          context,
                          title: 'الكل',
                          index: 0,
                        ),
                      ),
                      Expanded(
                        child: _buildTab(
                          context,
                          title: ' المتصلة',
                          index: 2,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: Static.getheight(context, 24),
                        color: const Color.fromRGBO(210, 210, 210, 1),
                      ),
                      Expanded(
                        child: _buildTab(
                          context,
                          title: 'غير المتصلة',
                          index: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            'المخابر',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 24),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BuildContext context, {
    required String title,
    required int index,
  }) {
    final appModeController = Get.find<HomeController>();

    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: Static.getheight(context, 12),
        ),
        decoration: BoxDecoration(
          color: appModeController.isPreviewMode
              ? index == 0
                  ? Colors.grey.shade500
                  : Colors.transparent
              : isSelected
                  ? const Color.fromRGBO(61, 114, 255, 1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w500,
              fontSize: Static.getwidth(context, 14),
              color: appModeController.isPreviewMode
                  ? index == 0
                      ? Colors.white
                      : const Color.fromRGBO(94, 94, 94, 1)
                  : isSelected
                      ? Colors.white
                      : const Color.fromRGBO(94, 94, 94, 1),
            ),
          ),
        ),
      ),
    );
  }
}
