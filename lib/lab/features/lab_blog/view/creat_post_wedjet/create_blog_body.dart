import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/app_note_card.dart';
import 'package:template/core/widgets/input_textfield.dart';
import 'package:template/lab/features/lab_blog/view/creat_post_wedjet/blog_images_picker.dart.dart';
import 'package:template/lab/features/lab_blog/view/creat_post_wedjet/create_blog_header.dart';

import '../../controller/create_blog_controller.dart';
import 'sensitive_info_card.dart';

class CreateBlogBody extends StatelessWidget {
  const CreateBlogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<CreateBlogController>();

    return Form(
      key: controller.formKey,
      child: ListView(
        keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const CreateBlogHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              6,
              20,
              24,
            ),
            child: Column(
              children: [
                Obx(
                  () {
                    if (controller.isEditMode) {
                      final post =
                          controller.editingPost.value;

                      return AppNoteCard(
                        icon:
                            Icons.edit_note_rounded,
                        color:
                            const Color(0xFFE9A700),
                        backgroundColor:
                            const Color(0xFFFFF7E1),
                        borderColor:
                            const Color(0xFFFFD97D),
                        textColor:
                            const Color(0xFF9D7000),
                        messages: [
                          post?.reviewMessage
                                      .trim()
                                      .isNotEmpty ==
                                  true
                              ? post!.reviewMessage
                                  .trim()
                              : 'بعد تعديل المنشور سيتم إرساله مرة أخرى للمراجعة.',
                        ],
                      );
                    }

                    return const AppNoteCard(
                      messages: [
                        'سيتم إرسال منشورك للمراجعة من قبل الأدمن.',
                        'سيتم إشعارك بعد الموافقة على نشره في المجتمع.',
                      ],
                    );
                  },
                ),
                const SizedBox(height: 22),
                AuthInputField(
                  title: 'عنوان المنشور *',
                  hintText:
                      'اكتب عنواناً واضحاً وجذاباً للمنشور',
                  controller:
                      controller.titleController,
                  keyboardType:
                      TextInputType.text,
                  validator:
                      AppValidators.validateTitle,
                  fillColor: AppColors.white,
                  borderColor:
                      AppColors.littleBlue
                          .withOpacity(.9),
                  focusedBorderColor:
                      AppColors.primaryBlue,
                  suffixIcon: const Icon(
                    Icons.title_rounded,
                    color:
                        AppColors.normalText,
                  ),
                ),
                const SizedBox(height: 20),
                AuthInputField(
                  title: 'محتوى المنشور *',
                  hintText:
                      'اكتب محتوى المنشور بالتفصيل...',
                  controller:
                      controller.contentController,
                  keyboardType:
                      TextInputType.multiline,
                  maxLines: 7,
                  validator:
                      AppValidators.validateContent,
                  fillColor: AppColors.white,
                  borderColor:
                      AppColors.littleBlue
                          .withOpacity(.9),
                  focusedBorderColor:
                      AppColors.primaryBlue,
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(
                      bottom: 120,
                    ),
                    child: Icon(
                      Icons
                          .format_align_right_rounded,
                      color:
                          AppColors.normalText,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SensitiveInfoCard(),
                const SizedBox(height: 22),
                // const BlogImagesPicker(),
                BlogImagesPicker(
  selectedImages:
      controller.selectedImages,
  onPickImages:
      controller.pickImages,
  onRemoveImage:
      controller.removeNewImage,
),
              ],
            ),
          ),
        ],
      ),
    );
  }
}