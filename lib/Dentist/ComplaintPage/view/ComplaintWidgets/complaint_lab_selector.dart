import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/ComplaintPage/view/ComplaintWidgets/complaint_lab_loading.dart';
import 'package:template/Dentist/HomePage/controller/home_controller.dart';
import 'package:template/core/utils/static.dart';

class ComplaintLabSelector extends StatelessWidget {
  const ComplaintLabSelector({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isLoading.value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'المخبر',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: Static.getwidth(context, 14),
                fontWeight: FontWeight.w700,
                color: const Color(0xff252A34),
              ),
            ),
            SizedBox(height: Static.getheight(context, 12)),
            const ComplaintLabLoading(),
          ],
        );
      }

      if (homeController.labsDetails.isEmpty) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(Static.getwidth(context, 16)),
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.orange.withValues(alpha: 0.25)),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline_rounded, color: Colors.orange),
              SizedBox(width: Static.getwidth(context, 10)),
              Expanded(
                child: Text(
                  'لا يوجد مخابر مرتبطة بحسابك حاليًا',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: Static.getwidth(context, 12),
                    color: Colors.orange.shade800,
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اختر المخبر',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: Static.getwidth(context, 14),
              fontWeight: FontWeight.w700,
              color: const Color(0xff252A34),
            ),
          ),
          SizedBox(height: Static.getheight(context, 12)),
          DropdownButtonFormField<int>(
            initialValue: homeController.selectedLabId.value,
            isExpanded: true,
            decoration: InputDecoration(
              hintText: 'اختر المخبر الذي تريد تقديم الشكوى بحقه',
              hintStyle: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: Static.getwidth(context, 11),
                color: const Color(0xffA1A8B5),
              ),
              prefixIcon: const Icon(
                Icons.business_outlined,
                color: Color(0xff8992A3),
                size: 21,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 16),
                vertical: Static.getheight(context, 16),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xffE7EAF0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xffE7EAF0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    const BorderSide(color: Color(0xff1C75BC), width: 1.5),
              ),
            ),
            items: homeController.labsDetails.map((lab) {
              return DropdownMenuItem<int>(
                value: lab.id,
                child: Text(
                  lab.name ?? '',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans Arabic',
                    fontSize: Static.getwidth(context, 12),
                    color: const Color(0xff252A34),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              homeController.selectedLabId.value = value;
            },
          ),
        ],
      );
    });
  }
}
