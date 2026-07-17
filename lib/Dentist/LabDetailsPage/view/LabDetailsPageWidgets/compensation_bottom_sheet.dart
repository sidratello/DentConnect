import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/widgets/app_spacing.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';
import '../../model/compensation_item_model.dart';
import 'compensation_item_card.dart';

void showCompensationBottomSheet(
  BuildContext context,
) {
  final List<CompensationItemModel> compensations = [
    CompensationItemModel(
      name: 'CRISTAL EMAX',
      price: '80\$',
    ),
    CompensationItemModel(
      name: 'VENEER',
      price: '65\$',
    ),
    CompensationItemModel(
      name: 'ZIRCON 2D',
      price: '90\$',
    ),
    CompensationItemModel(
      name: 'ZIRCON 3D VIP',
      price: '120\$',
    ),
    CompensationItemModel(
      name: 'ZIRCON 7D VIP',
      price: '140\$',
    ),
    CompensationItemModel(
      name: 'ZIRCON IMPLANT',
      price: '150\$',
    ),
    CompensationItemModel(
      name: 'ZIRCON FRAME WORK',
      price: '95\$',
    ),
    CompensationItemModel(
      name: 'CERAMIC CAD CAM',
      price: '100\$',
    ),
    CompensationItemModel(
      name: 'CERAMIC IMPLANT',
      price: '130\$',
    ),
    CompensationItemModel(
      name: 'CERAMIC MARYLAND',
      price: '110\$',
    ),
    CompensationItemModel(
      name: 'EMAX - INLAY',
      price: '70\$',
    ),
    CompensationItemModel(
      name: 'EMAX - ONLAY',
      price: '72\$',
    ),
    CompensationItemModel(
      name: 'SNAP ON SMILE',
      price: '200\$',
    ),
    CompensationItemModel(
      name: 'PARTIAL DIGITAL',
      price: '85\$',
    ),
    CompensationItemModel(
      name: 'ATTACHMINT',
      price: '40\$',
    ),
    CompensationItemModel(
      name: 'TEMPORARY',
      price: '25\$',
    ),
  ];

  Get.bottomSheet(
    Container(
      height: MediaQuery.of(context).size.height * 0.82,
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
        vertical: Static.getheight(context, 24),
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: Static.getwidth(context, 52),
            height: Static.getheight(context, 5),
            decoration: BoxDecoration(
              color: AppColors.boxGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          AppSpacing.height(context, 24),
          Text(
            'أنواع التعويضات والأسعار',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w700,
              fontSize: Static.getwidth(context, 22),
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          AppSpacing.height(context, 10),
          Text(
            'جميع أنواع التعويضات التي يدعمها المخبر',
            style: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontWeight: FontWeight.w400,
              fontSize: Static.getwidth(context, 15),
              color: AppColors.textSecondary,
            ),
          ),
          AppSpacing.height(context, 28),
          Expanded(
            child: ListView.separated(
              itemCount: compensations.length,
              separatorBuilder: (_, __) => SizedBox(
                height: Static.getheight(context, 14),
              ),
              itemBuilder: (context, index) {
                return CompensationItemCard(
                  item: compensations[index],
                );
              },
            ),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
    backgroundColor: AppColors.surfaceTintColor,
  );
}
