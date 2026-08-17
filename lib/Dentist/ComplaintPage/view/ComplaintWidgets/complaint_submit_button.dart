import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class ComplaintSubmitButton extends StatelessWidget {
  const ComplaintSubmitButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Static.getheight(context, 56),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.send_rounded, size: 20),
            SizedBox(width: Static.getwidth(context, 10)),
            Text(
              'إرسال الشكوى',
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontSize: Static.getwidth(context, 14),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
