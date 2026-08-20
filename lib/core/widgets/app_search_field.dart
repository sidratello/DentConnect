import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchField
    extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onClear;

  const AppSearchField({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.controller,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      margin: EdgeInsets.fromLTRB(
        20.w,
        0,
        20.w,
        16.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xffE9EEFF),
            Color(0xffDCE6FF),
            Colors.white,
          ],
        ),
        borderRadius:
            BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(.12),
            blurRadius: 18.r,
            offset: Offset(0, 7.h),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          textAlign: TextAlign.right,
          textInputAction:
              TextInputAction.search,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder:
                InputBorder.none,
            focusedBorder:
                InputBorder.none,
            hintText: hintText,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: const Color.fromARGB(
                255,
                12,
                19,
                120,
              ),
              size: 32.sp,
            ),
            suffixIcon: onClear == null
                ? null
                : IconButton(
                    onPressed: onClear,
                    icon: const Icon(
                      Icons.close_rounded,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}