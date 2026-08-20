import 'package:flutter/material.dart';

import '../../../../core_dentist/theme/app_colors.dart';
import '../../../../core_dentist/utils/static.dart';
import '../../model/compensation_item_model.dart';

class CompensationItemCard extends StatelessWidget {
  final CompensationItemModel item;

  const CompensationItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 18),
        vertical: Static.getheight(context, 16),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).shadowColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 14),
              vertical: Static.getheight(context, 6),
            ),
            decoration: BoxDecoration(
              color: AppColors.boxBlack,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              item.price,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 14),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: Static.getwidth(context, 14),
              ),
              child: Text(
                item.name,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w600,
                  fontSize: Static.getwidth(context, 15),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
