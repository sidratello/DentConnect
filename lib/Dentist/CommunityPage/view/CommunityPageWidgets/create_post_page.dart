import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core_dentist/utils/static.dart';
import 'package:template/core_dentist/widgets/app_spacing.dart';
import 'package:template/core_dentist/widgets/appbar_vector_black.dart';
import 'package:template/core_dentist/widgets/top_background.dart';

import '../../../../core_dentist/theme/app_colors.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();

    final contentController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceTintColor,
        surfaceTintColor: AppColors.surfaceTintColor,
        elevation: 0,
        title: Text(
          ' إنشاء منشور جديد',
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontWeight: FontWeight.w700,
            fontSize: Static.getwidth(context, 22),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [AppbarVectorBlack()],
      ),
      body: TopBackground(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(
              Static.getwidth(
                context,
                24,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(
                    Static.getwidth(
                      context,
                      18,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          hintText: 'عنوان المنشور',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: contentController,
                        maxLines: 8,
                        decoration: const InputDecoration(
                          hintText: 'اكتب محتوى المنشور...',
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.height(context, 20),
                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: Static.getheight(context, 16),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      border: Border.all(
                        color: AppColors.borderBlack,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo_library_outlined,
                        ),
                        AppSpacing.width(context, 8),
                        const Text(
                          'إضافة صور',
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacing.height(context, 20),
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Center(
                    child: Text(
                      'ستظهر الصور المختارة هنا',
                    ),
                  ),
                ),
                AppSpacing.height(context, 30),
                SizedBox(
                  width: double.infinity,
                  height: Static.getheight(context, 52),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Get.snackbar(
                        'تم الإرسال',
                        'تم إرسال المنشور للمراجعة',
                        backgroundColor: AppColors.success,
                        colorText: AppColors.white,
                      );
                    },
                    child: Text(
                      'إرسال للمراجعة',
                      style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: Static.getwidth(context, 18),
                          color: AppColors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
