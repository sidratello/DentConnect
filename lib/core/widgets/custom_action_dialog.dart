// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomActionDialog {
//   static void show({
//     required BuildContext context,
//     required String title,
//     required Widget content,
//     required Widget confirmButton,
//     String cancelText = 'إلغاء',
//     bool barrierDismissible = true,
//   }) {
//     Get.dialog(
//       Directionality(
//         textDirection: TextDirection.rtl,
//         child: AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(18),
//           ),
//           titlePadding: const EdgeInsets.fromLTRB(
//             20,
//             20,
//             20,
//             10,
//           ),
//           contentPadding: const EdgeInsets.fromLTRB(
//             20,
//             0,
//             20,
//             18,
//           ),
//           actionsPadding: const EdgeInsets.fromLTRB(
//             16,
//             0,
//             16,
//             16,
//           ),
//           title: Text(title),
//           content: content,
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: Text(cancelText),
//             ),
//             confirmButton,
//           ],
//         ),
//       ),
//       barrierDismissible: barrierDismissible,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomActionDialog {
  static Future<T?> show<T>({
    BuildContext? context, // يبقى موجوداً للتوافق مع الكود القديم
    required String title,
    required Widget content,

    Widget? confirmButton,

    String? cancelText = 'إلغاء',

    VoidCallback? onCancel,

    bool barrierDismissible = true,
  }) {
    return Get.dialog<T>(
      Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          titlePadding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            10,
          ),
          contentPadding: const EdgeInsets.fromLTRB(
            20,
            0,
            20,
            18,
          ),
          actionsPadding: const EdgeInsets.fromLTRB(
            16,
            0,
            16,
            16,
          ),
          actionsAlignment: MainAxisAlignment.center,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: content,
          actions: [
            if (cancelText != null)
              TextButton(
                onPressed: onCancel ?? Get.back,
                child: Text(cancelText),
              ),

            if (confirmButton != null)
              confirmButton,
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black54,
    );
  }
}