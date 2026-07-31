// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:template/lab/features/lab_blog/model/creat_blog_model.dart';
// import 'package:template/lab/features/lab_blog/repositry/lab_blog_repository.dart';



// class CreateBlogController extends GetxController {
//   final LabBlogRepository _repository;
//   final ImagePicker _imagePicker;

//   CreateBlogController({
//     LabBlogRepository? repository,
//     ImagePicker? imagePicker,
//   })  : _repository =
//             repository ?? LabBlogRepository(),
//         _imagePicker = imagePicker ?? ImagePicker();

//   final formKey = GlobalKey<FormState>();

//   final titleController = TextEditingController();
//   final contentController = TextEditingController();

//   final selectedImages = <File>[].obs;
//   final isSensitiveRedacted = false.obs;
//   final isSubmitting = false.obs;

// final createdPost = Rxn<CreateBlogModel>();

//   bool get hasImages => selectedImages.isNotEmpty;

//   @override
//   void onClose() {
//     titleController.dispose();
//     contentController.dispose();
//     super.onClose();
//   }

//   Future<void> pickImages() async {
//     try {
//       final pickedFiles = await _imagePicker.pickMultiImage(
//         imageQuality: 90,
//       );

//       if (pickedFiles.isEmpty) return;

//       final newFiles = pickedFiles
//           .map((image) => File(image.path))
//           .where(
//             (file) => !_isAlreadySelected(file.path),
//           )
//           .toList();

//       selectedImages.addAll(newFiles);
//     } catch (_) {
//       _showError(
//         'تعذر اختيار الصور. تحقق من صلاحية الوصول إلى الصور.',
//       );
//     }
//   }

//   Future<void> takePhoto() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(
//         source: ImageSource.camera,
//         imageQuality: 90,
//       );

//       if (pickedFile == null) return;

//       if (!_isAlreadySelected(pickedFile.path)) {
//         selectedImages.add(File(pickedFile.path));
//       }
//     } catch (_) {
//       _showError(
//         'تعذر فتح الكاميرا.',
//       );
//     }
//   }

//   void removeImage(int index) {
//     if (index < 0 || index >= selectedImages.length) {
//       return;
//     }

//     selectedImages.removeAt(index);
//   }

//   void clearImages() {
//     selectedImages.clear();
//   }

//   void toggleSensitive(bool? value) {
//     isSensitiveRedacted.value = value ?? false;
//   }

// Future<void> submit() async {
//   FocusManager.instance.primaryFocus?.unfocus();

//   if (isSubmitting.value) return;

//   final isValid =
//       formKey.currentState?.validate() ?? false;

//   if (!isValid) return;

//   isSubmitting.value = true;

//   final response =
//       await _repository.createBlogPost(
//     title: titleController.text,
//     content: contentController.text,
//     isSensitiveRedacted:
//         isSensitiveRedacted.value,
//     documentFiles: List<File>.from(
//       selectedImages,
//     ),
//   );

//   isSubmitting.value = false;

//   if (!response.success ||
//       response.data == null) {
//     Get.snackbar(
//       'خطأ',
//       response.message,
//       snackPosition: SnackPosition.BOTTOM,
//     );

//     return;
//   }

//   createdPost.value = response.data;

//   Get.snackbar(
//     'تم إرسال المنشور',
//     response.data!.reviewMessage.isNotEmpty
//         ? response.data!.reviewMessage
//         : 'تم إرسال المنشور للمراجعة.',
//     snackPosition: SnackPosition.BOTTOM,
//   );

//   clearForm();
// }

//   void clearForm() {
//     titleController.clear();
//     contentController.clear();
//     selectedImages.clear();
//     isSensitiveRedacted.value = false;
//     formKey.currentState?.reset();
//   }

//   void goBack() {
//     Get.back();
//   }

//   bool _isAlreadySelected(String path) {
//     return selectedImages.any(
//       (file) => file.path == path,
//     );
//   }

//   void _showError(String message) {
//     Get.snackbar(
//       'تعذر إتمام العملية',
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       margin: const EdgeInsets.all(16),
//     );
//   }







// }




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:template/lab/features/lab_blog/model/creat_blog_model.dart';
import 'package:template/lab/features/lab_blog/model/post_model.dart';
import 'package:template/lab/features/lab_blog/repositry/lab_blog_repository.dart';

class CreateBlogController extends GetxController {
  final LabBlogRepository _repository;
  final ImagePicker _imagePicker;

  CreateBlogController({
    LabBlogRepository? repository,
    ImagePicker? imagePicker,
  })  : _repository =
            repository ?? LabBlogRepository(),
        _imagePicker =
            imagePicker ?? ImagePicker();

  final formKey = GlobalKey<FormState>();

  final titleController =
      TextEditingController();

  final contentController =
      TextEditingController();

  /// الصور الجديدة المختارة من الجهاز.
  final selectedImages = <File>[].obs;

  /// الصور القديمة الموجودة على الخادم.
  final existingAttachments =
      <BlogPostAttachment>[].obs;

  final isSensitiveRedacted = false.obs;
  final isSubmitting = false.obs;

  final createdPost = Rxn<CreateBlogModel>();

  /// يكون null عند إنشاء منشور جديد.
  /// ويحتوي المنشور عند فتح شاشة التعديل.
  final editingPost = Rxn<BlogPostModel>();

  bool get isEditMode =>
      editingPost.value != null;

  bool get hasNewImages =>
      selectedImages.isNotEmpty;

  bool get hasExistingImages =>
      existingAttachments.isNotEmpty;

  bool get hasImages =>
      hasNewImages || hasExistingImages;

  String get screenTitle => isEditMode
      ? 'تعديل المنشور'
      : 'إضافة منشور';

  String get submitButtonText => isEditMode
      ? 'إرسال للمراجعة'
      : 'إرسال للمراجعة';

  @override
  void onInit() {
    super.onInit();

    _initializeForm();
  }

  void _initializeForm() {
    final arguments = Get.arguments;

    if (arguments is! BlogPostModel) {
      return;
    }

    editingPost.value = arguments;

    titleController.text = arguments.title;
    contentController.text =
        arguments.content;

    isSensitiveRedacted.value =
        arguments.isSensitiveRedacted;

    existingAttachments.assignAll(
      arguments.attachments,
    );
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();

    super.onClose();
  }

  Future<void> pickImages() async {
    try {
      final pickedFiles =
          await _imagePicker.pickMultiImage(
        imageQuality: 90,
      );

      if (pickedFiles.isEmpty) {
        return;
      }

      final newFiles = pickedFiles
          .map(
            (image) => File(image.path),
          )
          .where(
            (file) =>
                !_isAlreadySelected(file.path),
          )
          .toList();

      selectedImages.addAll(newFiles);
    } catch (_) {
      _showError(
        'تعذر اختيار الصور. تحقق من صلاحية الوصول إلى الصور.',
      );
    }
  }

  Future<void> takePhoto() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 90,
      );

      if (pickedFile == null) {
        return;
      }

      if (!_isAlreadySelected(
        pickedFile.path,
      )) {
        selectedImages.add(
          File(pickedFile.path),
        );
      }
    } catch (_) {
      _showError(
        'تعذر فتح الكاميرا.',
      );
    }
  }

  void removeNewImage(int index) {
    if (index < 0 ||
        index >= selectedImages.length) {
      return;
    }

    selectedImages.removeAt(index);
  }

  void toggleSensitive(bool? value) {
    isSensitiveRedacted.value =
        value ?? false;
  }

  Future<void> submit() async {
    FocusManager.instance.primaryFocus
        ?.unfocus();

    if (isSubmitting.value) {
      return;
    }

    final isValid =
        formKey.currentState?.validate() ??
            false;

    if (!isValid) {
      return;
    }

    if (isEditMode) {
      await _updatePost();
      return;
    }

    await _createPost();
  }

  Future<void> _createPost() async {
    isSubmitting.value = true;

    try {
      final response =
          await _repository.createBlogPost(
        title: titleController.text.trim(),
        content:
            contentController.text.trim(),
        isSensitiveRedacted:
            isSensitiveRedacted.value,
        documentFiles:
            List<File>.from(
          selectedImages,
        ),
      );

      if (!response.success ||
          response.data == null) {
        _showError(response.message);
        return;
      }

      createdPost.value = response.data;

      Get.snackbar(
        'تم إرسال المنشور',
        response.data!.reviewMessage
                .isNotEmpty
            ? response
                .data!.reviewMessage
            : 'تم إرسال المنشور للمراجعة.',
        snackPosition:
            SnackPosition.BOTTOM,
      );

      clearForm();
    } catch (_) {
      _showError(
        'حدث خطأ أثناء إرسال المنشور.',
      );
    } finally {
      isSubmitting.value = false;
    }
  }

 Future<void> _updatePost() async {
  final post = editingPost.value;

  if (post == null) {
    return;
  }

  isSubmitting.value = true;

  try {
    final response =
        await _repository.updateBlogPost(
      postId: post.postId,
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      isSensitiveRedacted:
          isSensitiveRedacted.value,
      newDocumentFiles:
          List<File>.from(selectedImages),
    );

    if (!response.success ||
        response.data == null) {
      _showError(response.message);
      return;
    }

    final message =
        response.data!.reviewMessage.trim().isNotEmpty
            ? response.data!.reviewMessage
            : 'تم تعديل المنشور وإرساله للمراجعة.';

    Get.back(
      result: {
        'success': true,
        'message': message,
      },
    );
  } catch (_) {
    _showError(
      'حدث خطأ أثناء تعديل المنشور.',
    );
  } finally {
    isSubmitting.value = false;
  }
}

  void clearForm() {
    titleController.clear();
    contentController.clear();

    selectedImages.clear();
    existingAttachments.clear();

    isSensitiveRedacted.value = false;

    formKey.currentState?.reset();
  }

  void goBack() {
    Get.back();
  }

  bool _isAlreadySelected(
    String path,
  ) {
    return selectedImages.any(
      (file) => file.path == path,
    );
  }

  void _showError(String message) {
    Get.snackbar(
      'تعذر إتمام العملية',
      message,
      snackPosition:
          SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}