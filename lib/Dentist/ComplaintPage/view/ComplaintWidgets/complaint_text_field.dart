import 'package:flutter/material.dart';
import 'package:template/core_dentist/utils/static.dart';

class ComplaintTextField extends StatelessWidget {
  const ComplaintTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.maxLines = 1,
    this.minLines,
    this.alignLabelWithHint = false,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final int maxLines;
  final int? minLines;
  final bool alignLabelWithHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: Static.getwidth(context, 14),
            fontWeight: FontWeight.w700,
            color: const Color(0xff252A34),
          ),
        ),
        SizedBox(height: Static.getheight(context, 12)),
        TextField(
          controller: controller,
          textDirection: TextDirection.rtl,
          maxLines: maxLines,
          minLines: minLines,
          style: TextStyle(
            fontFamily: 'IBM Plex Sans Arabic',
            fontSize: Static.getwidth(context, 12),
            color: const Color(0xff252A34),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'IBM Plex Sans Arabic',
              fontSize: Static.getwidth(context, 11),
              color: const Color(0xffA1A8B5),
            ),
            prefixIcon: Icon(
              icon,
              color: const Color(0xff8992A3),
              size: 21,
            ),
            filled: true,
            fillColor: Colors.white,
            alignLabelWithHint: alignLabelWithHint,
            contentPadding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 16),
              vertical: Static.getheight(context, 16),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xffE7EAF0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xffE7EAF0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xff1C75BC),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
