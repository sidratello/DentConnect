import 'package:flutter/material.dart';

import 'package:template/core/app_text_styles.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/lab/features/profile/model/profile_modil.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/custom_gallery_grid.dart';
import 'package:template/lab/features/profile/views/wedjet/edit_profile_wedjet/section_card.dart';

class GalleryCard extends StatelessWidget {
  final LabProfileModel profile;

  const GalleryCard({
    super.key,
    required this.profile,
  });

  String imageUrl(String path) {
    String baseUrl = '${Static.imageBaseUrl}/';

    return '$baseUrl$path';
  }

  @override
  Widget build(BuildContext context) {
    final gallery = profile.gallery;

    return ProfileSectionCard(
      title: 'معرض الأعمال',
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (gallery.isEmpty)
          Text(
            'لا توجد صور أعمال',
            style: AppTextStyles.ibmRegular14NeutralStyle,
          )
        else
          GalleryGrid(
            itemCount: gallery.length,
            imageUrl: (index) => imageUrl(gallery[index].path),
          )
      ],
    );
  }
}
