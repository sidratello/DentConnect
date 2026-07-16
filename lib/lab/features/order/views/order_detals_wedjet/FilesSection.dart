
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:open_filex/open_filex.dart';
import 'package:template/core/app_colors.dart';

import 'package:template/core/app_text_styles.dart';

import 'package:path_provider/path_provider.dart';

class FilesSection extends StatelessWidget {
  final dynamic order;

  const FilesSection({
    super.key,
    required this.order,
  });

  static const String baseUrl = 'http://192.168.1.10:44352/';

  Future<void> openFile(BuildContext context, String path) async {
    try {
      final fileUrl = '$baseUrl$path';
      final fileName = path.split('/').last;

      final dir = await getTemporaryDirectory();
      print('Cache Folder: ${dir.path}');
      final localPath = '${dir.path}/$fileName';
print('Saved File: $localPath');
      await Dio().download(fileUrl, localPath);
print('URL: $fileUrl');
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
      return SectionBox(
        title: 'ملفات رقمية',
        child: Text(
          '  لا توجد ملفات رقمية',
          style: AppTextStyles.ibmRegular14NeutralStyle,
        ),
      );
    }

    return SectionBox(
      title: 'ملفات رقمية',
      child: Column(
        children: order.files.map<Widget>((file) {
          final fileName = file.path.split('/').last;

          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              fileName,
              style: AppTextStyles.ibmRegular14NeutralStyle,
            ),
            trailing: const Icon(Icons.open_in_new_rounded),
            onTap: () {
              openFile(context, file.path);
            },
          );
        }).toList(),
        
      ),
    );
  }
}



class SectionBox extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionBox({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.darkBlue.withOpacity(.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}