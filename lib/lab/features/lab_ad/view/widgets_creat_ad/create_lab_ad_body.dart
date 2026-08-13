import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/app_validators.dart';
import 'package:template/core/widgets/app_note_card.dart';
import 'package:template/core/widgets/input_textfield.dart';

import 'package:template/lab/features/lab_blog/view/creat_post_wedjet/blog_images_picker.dart.dart';

import '../../controller/create_lab_ad_controller.dart';
import 'ad_expiration_date_field.dart';
import 'ad_target_card.dart';
import 'create_lab_ad_header.dart';

class CreateLabAdBody
    extends GetView<CreateLabAdController> {
  const CreateLabAdBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: ListView(
        keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior
                .onDrag,
        children: [
          const CreateLabAdHeader(),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(
              20,
              6,
              20,
              28,
            ),
            child: Column(
              children: [
                const AppNoteCard(
                  messages: [
                    'سيتم إرسال طلب إعلانك للأدمن للمراجعة والتفعيل.',
                 
                  ],
                ),
                const SizedBox(height: 22),

                AuthInputField(
                  title:
                      'محتوى الإعلان *',
                  hintText:
                      'اكتب تفاصيل الإعلان هنا...\nمثل الخدمات التي يقدمها المخبر أو العروض الخاصة الموجهة للأطباء',
                  controller:
                      controller
                          .contentController,
                  keyboardType:
                      TextInputType
                          .multiline,
                  maxLines: 7,
                  validator:
                      AppValidators
                          .validateAdvertisementContent,
                  fillColor:
                      AppColors.white,
                  borderColor:
                      AppColors
                          .littleBlue
                          .withOpacity(.9),
                  focusedBorderColor:
                      AppColors
                          .primaryBlue,
                  suffixIcon:
                      const Padding(
                    padding:
                        EdgeInsets.only(
                      bottom: 120,
                    ),
                    child: Icon(
                      Icons
                          .format_align_right_rounded,
                      color:
                          AppColors
                              .normalText,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const AdTargetCard(),

                const SizedBox(height: 22),

                BlogImagesPicker(
                  title:
                      'صور الإعلان',
                  isOptional: true,
                  selectedImages:
                      controller
                          .selectedImages,
                  onPickImages:
                      controller.pickImages,
                  onRemoveImage:
                      controller.removeImage,
                ),

                const SizedBox(height: 22),

                const AdExpirationDateField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}