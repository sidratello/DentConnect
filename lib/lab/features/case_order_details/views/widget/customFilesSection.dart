import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';
import 'package:template/lab/features/case_order_details/views/widget/SectionTitle.dart';
import 'package:template/lab/features/case_order_details/views/widget/details_section_card.dart';
import 'package:template/lab/shared/models/lab_order_model.dart';

class FilesSection extends StatelessWidget {
  final LabOrderModel order;

  const FilesSection({
    super.key,
    required this.order,
  });

  static const String baseUrl = 'http://192.168.1.3:44352/';

  Future<void> openFile(BuildContext context, String path) async {
    try {
      final fileUrl = path.startsWith('http') ? path : '$baseUrl$path';
      final fileName = path.split('/').last;

      final dir = await getTemporaryDirectory();
      final localPath = '${dir.path}/$fileName';

      await Dio().download(fileUrl, localPath);

      final result = await OpenFilex.open(
        localPath,
        type: 'model/stl',
      );

      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('لم يتم فتح الملف: ${result.message}'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء فتح الملف: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (order.files.isEmpty) {
      return const SizedBox.shrink();
    }

    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'ملفات STL',
            icon: Icons.view_in_ar_rounded,
          ),

          const SizedBox(height: 16),

          ...order.files.map((file) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.littleBlue.withOpacity(.25),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.littleBlue.withOpacity(.55),
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                leading: const Icon(
                  Icons.view_in_ar_rounded,
                  color: AppColors.primaryBlue,
                  size: 28,
                ),
                title: Text(
                  file.fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text(
                  file.type,
                  style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
                    color: AppColors.normalText,
                  ),
                ),
                trailing: const Icon(
                  Icons.open_in_new_rounded,
                  color: AppColors.primaryBlue,
                ),
                onTap: () {
                  openFile(context, file.path);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}