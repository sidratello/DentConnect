import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/static.dart';

class LabDetailsDescription extends StatelessWidget {
  const LabDetailsDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isExpanded = false.obs;

    const String description =
        'مخبر متخصص بالتعويضات السنية الرقمية والتقليدية مع خبرة طويلة في تصنيع مختلف أنواع التركيبات السنية باستخدام أحدث التقنيات والأجهزة الحديثة لضمان أفضل جودة ودقة في العمل وتقديم نتائج احترافية للأطباء والمرضى.';

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: const Duration(
              milliseconds: 250,
            ),
            curve: Curves.easeInOut,
            child: Text(
              description,
              maxLines: isExpanded.value ? null : 2,
              overflow: isExpanded.value
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w400,
                fontSize: Static.getwidth(context, 15),
                height: 24 / 15,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          SizedBox(
            height: Static.getheight(context, 8),
          ),
          GestureDetector(
            onTap: () {
              isExpanded.value = !isExpanded.value;
            },
            child: Text(
              isExpanded.value ? 'عرض أقل' : 'يمكنك رؤية المزيد',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w500,
                fontSize: Static.getwidth(context, 14),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
