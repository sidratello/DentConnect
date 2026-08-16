import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_helper.dart';
import 'package:template/core/app_text_styles.dart';

import '../../model/complaint_dentist_model.dart';

class ComplaintDentistCard
    extends StatelessWidget {
  final ComplaintDentistModel dentist;

  const ComplaintDentistCard({
    super.key,
    required this.dentist,
  });

  @override
  Widget build(BuildContext context) {
     final imageUrl =
        AppHelper.buildImageUrl(
      dentist.profilePictureUrl,
    );

    final hasImage =
        imageUrl.isNotEmpty;
    return Container(
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.littleBlue
              .withOpacity(.6),
        ),
      ),
      child: Directionality(
        textDirection:
            TextDirection.rtl,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor:
      AppColors.littleBlue.withOpacity(.45),
                  radius: 30,
                    backgroundImage:
                      hasImage
                          ? NetworkImage(
                              imageUrl,
                            )
                          : null,

                  child: !hasImage
                      ? const Icon(
                          Icons
                              .person_outline,
                          color: AppColors
                              .primaryBlue,
                          size: 30,
                        )
                      : null,
                ),

                const SizedBox(
                  width: 12,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Text(
                        dentist.name,
                        style: AppTextStyles
                            .ibmMedium18NeutralStyle
                            .copyWith(
                          color: AppColors
                              .darkBlue,
                          fontWeight:
                              FontWeight.w800,
                        ),
                      ),

                      if (dentist
                          .clinicName
                          .isNotEmpty)
                        Text(
                          dentist
                              .clinicName,
                          style: AppTextStyles
                              .ibmRegular12DarkStyle
                              .copyWith(
                            color: AppColors
                                .normalText,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            _DoctorInfoRow(
              icon:
                  Icons.email_outlined,
              title: 'البريد الإلكتروني',
              value:
                  dentist.email,
            ),

            _DoctorInfoRow(
              icon:
                  Icons.phone_outlined,
              title: 'رقم الهاتف',
              value:
                  dentist.phone,
            ),

            _DoctorInfoRow(
              icon:
                  Icons.location_on_outlined,
              title: 'عنوان العيادة',
              value:
                  dentist.clinicAddress,
            ),

            _DoctorInfoRow(
              icon:
                  Icons.location_city_outlined,
              title: 'المدينة',
              value:
                  dentist.city,
            ),

            _DoctorInfoRow(
              icon:
                  Icons.public_outlined,
              title: 'الدولة',
              value:
                  dentist.country,
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorInfoRow
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DoctorInfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (value.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 11,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color:
                AppColors.primaryBlue,
            size: 20,
          ),

          const SizedBox(
            width: 8,
          ),

          Expanded(
            child: Text(
              title,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.normalText,
              ),
            ),
          ),

          Flexible(
            child: Text(
              value,
              textAlign:
                  TextAlign.left,
              style: AppTextStyles
                  .ibmRegular14NeutralStyle
                  .copyWith(
                color:
                    AppColors.darkBlue,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}