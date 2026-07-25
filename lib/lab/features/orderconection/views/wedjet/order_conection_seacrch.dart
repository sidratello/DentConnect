// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class OrderConnectionSearchWidget extends StatelessWidget {
//   final ValueChanged<String> onChanged;

//   const OrderConnectionSearchWidget({
//     super.key,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//   height: 68.h,
//   margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
//   padding: EdgeInsets.symmetric(horizontal: 20.w),

//   decoration: BoxDecoration(
//     gradient: LinearGradient(
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//       colors: [
     
//         const Color(0xffE9EEFF),
//         const Color(0xffDCE6FF),
//            Colors.white,
//       ],
//     ),

//     borderRadius: BorderRadius.circular(30.r),

  
//     boxShadow: [
//       BoxShadow(
//         color: Colors.black.withOpacity(.20),
//         blurRadius: 20.r,
//         offset: Offset(0, 8.h),
//       ),
//     ],
//   ),

//   child: Directionality(
//     textDirection: TextDirection.rtl,
//     child: TextField(
//       onChanged: onChanged,
//       textAlign: TextAlign.right,

//       decoration: InputDecoration(
//         border: InputBorder.none,

//         hintText: 'ابحث باسم الطبيب أو العنوان',

//         prefixIcon: Icon(
//           Icons.search_rounded,
//           color: Color.fromARGB(255, 12, 19, 120),
//           size: 35.sp,
//         ),
//       ),
//     ),
//   ),
// );}}