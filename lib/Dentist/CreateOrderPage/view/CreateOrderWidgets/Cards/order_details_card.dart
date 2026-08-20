import 'package:flutter/material.dart';
import 'package:template/core_dentist/theme/app_colors.dart';
import 'package:template/core_dentist/utils/static.dart';

class OrderDetailsCard extends StatelessWidget {
  final Widget child;
  final String? title;
  final IconData? icon;
  final Widget? trailing;

  const OrderDetailsCard({
    super.key,
    required this.child,
    this.title,
    this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: Static.getheight(context, 18),
      ),
      padding: EdgeInsets.all(
        Static.getwidth(context, 18),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Row(
              children: [
                if (icon != null)
                  Container(
                    width: Static.getwidth(context, 36),
                    height: Static.getwidth(context, 36),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                if (icon != null)
                  SizedBox(
                    width: Static.getwidth(context, 10),
                  ),
                Expanded(
                  child: Text(
                    title!,
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans Arabic",
                      fontWeight: FontWeight.w700,
                      fontSize: Static.getwidth(context, 15),
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            SizedBox(
              height: Static.getheight(context, 16),
            ),
            Divider(
              color: AppColors.border,
              height: 1,
            ),
            SizedBox(
              height: Static.getheight(context, 16),
            ),
          ],
          child,
        ],
      ),
    );
  }
}
