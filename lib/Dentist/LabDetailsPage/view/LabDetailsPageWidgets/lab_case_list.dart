import 'package:flutter/material.dart';

import '../../../../core_dentist/utils/static.dart';
import 'lab_image_item.dart';

class LabCaseList extends StatelessWidget {
  final List<String> images;
  const LabCaseList({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 24),
          vertical: Static.getheight(context, 16),
        ),
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Static.getwidth(context, 12),
          mainAxisSpacing: Static.getheight(context, 12),
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return LabImageItem(
            imagePath: images[index],
            heroTag: 'lab_image_$index',
          );
        },
      ),
    );
  }
}
