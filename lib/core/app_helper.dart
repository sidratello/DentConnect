
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/lab/features/add_scan_slot/controller/scan_slots_controller.dart';
import 'package:template/lab/features/add_scan_slot/model/scan_slot_model.dart';
import 'package:template/lab/features/add_scan_slot/views/booking_details_dialog/scan_booking_details_dialog.dart';





class AppHelper {

  static String token = '';
static const String serverBaseUrl =
    'http://192.168.1.3:44334/';


  static void clear() {
    token = '';
  }
static Future<void> saveUserInfo(String token) async {
  AppHelper.token = token;



}


  static double get screenWidth {
    final view = PlatformDispatcher.instance.views.first;
    return view.physicalSize.width / view.devicePixelRatio;
  }

  static double get screenHeight {
    final view = PlatformDispatcher.instance.views.first;
    return view.physicalSize.height / view.devicePixelRatio;
  }

  static BorderRadius borderRadius() {
    return BorderRadius.circular(10);
  }



static BoxDecoration primaryButtonDecoration() {
  return BoxDecoration(
    color: AppColors.primary200,
    borderRadius: BorderRadius.circular(12),
    image: const DecorationImage(
      image: AssetImage('assets/images/Frame 2608747 (1)_cleanup.png'),
      alignment: Alignment.centerLeft,
      fit: BoxFit.cover,
      opacity: 0.35,
    ),
  );
}


static String arabicImpressionType(String value) {
  switch (value) {
    case 'Digital':
      return 'طبعة رقمية';
    case 'Traditional':
      return 'طبعة تقليدية';
    default:
      return value;
  }
}

 static  String getArabicTitle(String status) {
    switch (status) {

      case 'Accepted':
        return 'مقبول';
      case 'RequestInfo':
        return ' طلب معلومات اضافية';
      case 'InDesign':
        return 'قيد التصميم';
      case 'InProduction':
        return 'قيد الإنتاج';
        case 'InColoring':
  return 'قيد التلوين';
      case 'WaitingForClarification':
        return 'بانتظار توضيح  ';
      case 'Ready':
        return 'جاهز';
      case 'Delivered':
        return 'تم التسليم';
      case 'Cancelled':
        return 'ملغي';
          case 'Pennding':
        return 'معلقة';
      default:
        return status;
    }
  }


static String arabicCompensationType(
  String value,
) {
  switch (value.trim()) {
    case 'Veneer':
      return 'فينير';

    case 'ZirconCrown':
      return 'تاج زركون';

    case 'ImplantCrown':
      return 'تاج زرعة';

    case 'Bridge':
      return 'جسر';

    case 'FullDenture':
      return 'طقم أسنان كامل';

    case 'PartialDenture':
      return 'طقم أسنان جزئي';

    case 'Other':
      return 'أخرى';

    default:
      return value;
  }
}

   static IconData getIcon(String status) {
    switch (status) {

      case 'Accepted':
        return Icons.check_circle_outline_rounded;
      case 'RequestInfo':
        return Icons.info_outline_rounded;
      case 'InDesign':
        return Icons.draw_outlined;
        case 'InColoring':
  return Icons.palette_outlined;
      case 'InProduction':
        return Icons.factory_outlined;
      case 'WaitingForClarification':
        return Icons.hourglass_empty_rounded;
      case 'Ready':
        return Icons.local_shipping_outlined;
      case 'Delivered':
        return Icons.done_all_rounded;
      case 'Cancelled':
        return Icons.cancel_outlined;
      case 'Pending':
        return Icons.hourglass_empty_rounded;
      default:
        return Icons.info_outlined;
    }
  }
   static  Color getColor(String status) {
    switch (status) {

      case 'Accepted':
        return AppColors.green;
      case 'RequestInfo':
        return const Color(0xFFE69500);
      case 'InDesign':
        return const Color(0xFF7C3AED);
        case 'InColoring':
  return const Color.fromARGB(255, 243, 128, 241);
      case 'InProduction':
        return const Color(0xFF0891B2);
      case 'WaitingForClarification':
        return AppColors.normalText;
      case 'Ready':
        return AppColors.primaryBlue;
      case 'Delivered':
        return AppColors.green;
      case 'Cancelled':
        return AppColors.red;
      default:
        return AppColors.darkBlue;
    }
  }

   static String toothImage(int toothNumber) {
    final digit = toothNumber % 10;

    if (digit == 1 || digit == 2) {
      return 'assets/images/incisor.png';
    }

    if (digit == 3) {
      return 'assets/images/canine.png';
    }

    if (digit == 4 || digit == 5) {
      return 'assets/images/premolar__1_-removebg-preview.png';
    }

    return 'assets/images/ChatGPT_Image_Jun_20__2026__02_22_49_PM-removebg-preview.png';
  }
  static Color getLightColor(String status) {
  return getColor(status).withOpacity(0.10);
}
static String arabicImpressionStage(String value) {
  switch (value) {
    case 'FinalImpression':
      return 'مرحلة نهائية';
    case 'PlasticImpression':
      return 'مرحلة بلاستيكية';
    default:
      return value;
  }
}

static String buildImageUrl(String? path) {
  final trimmedPath = path?.trim() ?? '';

  if (trimmedPath.isEmpty) {
    return '';
  }

  if (trimmedPath.startsWith('http://') ||
      trimmedPath.startsWith('https://')) {
    return trimmedPath;
  }

  final normalizedPath = trimmedPath.startsWith('/')
      ? trimmedPath.substring(1)
      : trimmedPath;

  return '$serverBaseUrl$normalizedPath';
}

  static BoxDecoration glassBoxDecoration({double opacity = .12}) {
    return BoxDecoration(
      borderRadius: borderRadius(),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          // AppColors.creamWhite.withOpacity(opacity * 1.2),
          // AppColors.creamWhite.withOpacity(opacity * .7),
        ],
      ),
      border: Border.all(
        // color: AppColors.creamWhite.withOpacity(.85),
        width: 1.2,
      ),
    );
  }
static String getDoctorInitial(String name) {
  final cleaned = name
      .replaceAll('Dr.', '')
      .replaceAll('د.', '')
      .trim();

  return cleaned.isNotEmpty ? cleaned[0].toUpperCase() : '?';
}

  static void showBirthdayDatePicker(
    BuildContext context,
    TextEditingController conteroller,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      // helpText: LocalKeys.selectDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              // primary: AppColors.primaryPurple,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                // foregroundColor: AppColors.primaryPurple,
              ),
            ),
          ),
          child: child!,
        );
      },
    )?.then((value) => value);

    if (picked != null) {
      final formattedDate = "${picked.year}-${picked.month}-${picked.day}";
      conteroller.text = formattedDate;
    }
  }

  // static SvgPicture viewSvg(String path, {Color? color, double? height}) {
  //   return SvgPicture.asset(path, color: color, height: height);
  // }

  static ImageProvider viewAsset(String path) {
    return AssetImage(path);
  }

  static void showLoading() {
    // Get.dialog(const LoadingIndicator(), barrierDismissible: false);
  }

  // static void showSuccesDialog(String message) {
  //   Get.dialog(SuccessDialog(body: message), barrierDismissible: true);
  // }

  // static void showErrorDialog(String message) {
  //   Get.dialog(ErrorDialog(body: message), barrierDismissible: true);
  // }

static void showScanBookingDetails({
  required BuildContext context,
  required ScanSlotModel slot,
  required ScanSlotsController controller,
}) {
  final booking = controller.bookingForSlot(
    slot.id,
  );

  if (booking == null) {
    Get.snackbar(
      'تنبيه',
      'لم يتم العثور على بيانات الحجز',
      snackPosition: SnackPosition.BOTTOM,
    );

    return;
  }

  ScanBookingDetailsDialog.show(
    context: context,
    booking: booking,
  );
}
static Widget shadowWrapper({
  required Widget child,
  double radius = 20,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.16),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: child,
  );
}

static BoxDecoration acceptButtonDecoration(double radius) {
  return BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [

        // Color(0xFF14B8A6), // Teal lighter
        // Color(0xFF0F766E), 
              Color(0xFF0F766E), // Dark Teal
        Color(0xFF0F766E),
      ],
    ),
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );
}
static BoxDecoration requestButtonDecoration(double radius) {
  return BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
// كحلي حيوي في الأعلى
      //  Color(0xFF3B82F6), // Light royal blue
      //   Color(0xFF2563EB), 
        Color(0xFF2563EB), // Royal Blue
        Color(0xFF2563EB),
      ],
    ),
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );
}
static BoxDecoration whiteCardDecoration({
  double radius = 18,
  bool hasBorder = true,
  Color? backgroundColor,
  Color? borderColor,
  double borderOpacity = .6,
  double borderWidth = 1,
}) {
  return BoxDecoration(
    color: backgroundColor ?? AppColors.white,
    borderRadius: BorderRadius.circular(radius),
    border: hasBorder
        ? Border.all(
            color: borderColor ??
                AppColors.littleBlue.withOpacity(borderOpacity),
            width: borderWidth,
          )
        : null,
  );
}
static BoxDecoration rejectButtonDecoration(double radius) {
  return BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
    // Color(0xFF9CA3AF), // Light gray
    //     Color(0xFF6B7280), 
           Color(0xFF4B5563), // Charcoal Gray
        Color(0xFF4B5563),
      ],
    ),
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );
}
  static bool validatePhoneNumber(String phone) {
    final regex = RegExp(r'^09\d{8}$');
    return regex.hasMatch(phone);
  }

  static bool validatePassword(String phone) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    return regex.hasMatch(phone);
  }

 
  static String fmtviews(int v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(1)}k';
    return '$v';
  }
}
