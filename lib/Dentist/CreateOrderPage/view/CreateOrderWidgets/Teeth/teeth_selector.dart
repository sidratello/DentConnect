import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/Dentist/CreateOrderPage/controller/create_order_controller.dart';

import '../Cards/order_details_card.dart';
import '../Shared/section_title.dart';
import 'tooth_item.dart';

class TeethSelector extends GetView<CreateOrderController> {
  const TeethSelector({super.key});

  static const List<String> upperRight = [
    "18",
    "17",
    "16",
    "15",
    "14",
    "13",
    "12",
    "11",
  ];

  static const List<String> upperLeft = [
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
  ];

  static const List<String> lowerRight = [
    "48",
    "47",
    "46",
    "45",
    "44",
    "43",
    "42",
    "41",
  ];

  static const List<String> lowerLeft = [
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
  ];

  Widget buildRow(List<String> teeth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: teeth.map((tooth) {
        return Obx(
          () => ToothItem(
            toothNumber: tooth,
            isSelected: controller.selectedTeeth.contains(tooth),
            onTap: () => controller.toggleTooth(tooth),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          icon: Icons.grid_view_rounded,
          title: "الأسنان المطلوبة",
        ),
        const SizedBox(height: 16),
        OrderDetailsCard(
          child: Column(
            children: [
              buildRow(upperRight),
              const SizedBox(height: 12),
              buildRow(upperLeft),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Divider(),
              ),
              buildRow(lowerRight),
              const SizedBox(height: 12),
              buildRow(lowerLeft),
            ],
          ),
        ),
      ],
    );
  }
}
