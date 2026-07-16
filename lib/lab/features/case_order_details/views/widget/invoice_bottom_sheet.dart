// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:template/core/app_colors.dart';
// import 'package:template/core/app_text_styles.dart';
// import 'package:template/core/widgets/app_button.dart';
// import 'package:template/lab/features/case_order_details/controller/case_order_details_controller.dart';
// import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_final_price_box.dart';
// import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_info_box.dart';
// import 'package:template/lab/features/case_order_details/views/wedjet_for_invoice.dart/invoice_table.dart';
// import 'package:template/lab/features/case_order_details/views/widget/notes_section.dart';

// class InvoiceBottomSheet extends StatelessWidget {
//   final CaseOrderDetailsController controller;

//   const InvoiceBottomSheet({
//     super.key,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final quote = controller.quote.value;
//     final order = controller.order.value;

//     if (quote == null || order == null) {
//       return const SizedBox.shrink();
//     }

//     return Container(
//       height: MediaQuery.of(context).size.height * .82,
//       padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
//       decoration: const BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(28),
//         ),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 48,
//             height: 5,
//             decoration: BoxDecoration(
//               color: AppColors.grey400,
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           const SizedBox(height: 18),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () => Get.back(),
//                 icon: const Icon(
//                   Icons.close_rounded,
//                   color: AppColors.darkBlue,
//                 ),
//               ),
//               const Spacer(),
//               Text(
//                 'عرض الفاتورة',
//                 style: AppTextStyles.ibmMedium18NeutralStyle.copyWith(
//                   color: AppColors.darkBlue,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               const Spacer(),
//               const Icon(
//                 Icons.file_copy_outlined,
//                 color: AppColors.primaryBlue,
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   InvoiceTable(controller: controller),
//                   const SizedBox(height: 14),
//                   InvoiceFinalPriceBox(controller: controller),
//                   const SizedBox(height: 14),
//                  DoctorNotesSection(
//   notes: quote.notes,
//   withCard: false,
// ),
//                   const SizedBox(height: 14),
//                   InvoiceInfoBox(),
//                   const SizedBox(height: 18),
//              Obx(() {
//   return AppButton(
//     title: 'تعديل السعر النهائي',
//     type: AppButtonType.filled,
//     height: 52,
//     isLoading: controller.isUpdatingPrice.value,
//     enabled: !controller.isUpdatingPrice.value,
//     icon: const Icon(
//       Icons.edit_outlined,
//       color: AppColors.white,
//       size: 20,
//     ),
//     onTap: () {
//       controller.updateFinalPrice(
//         controller.finalPriceController.text,
//       );
//     },
//   );
// }),

// const SizedBox(height: 12),

// AppButton(
//   title: 'عودة لتفاصيل الطلب',
//   type: AppButtonType.outlined,
//   height: 52,
//   textColor: AppColors.primaryBlue,
//   borderColor: AppColors.primaryBlue,
//   icon: const Icon(
//     Icons.arrow_back_rounded,
//     color: AppColors.primaryBlue,
//     size: 20,
//   ),
//   onTap: () => Get.back(),
// ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class _InvoiceTable extends StatelessWidget {
// //   final CaseOrderDetailsController controller;

// //   const _InvoiceTable({
// //     required this.controller,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final quote = controller.quote.value!;

// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border.all(
// //           color: AppColors.littleBlue.withOpacity(.6),
// //         ),
// //         borderRadius: BorderRadius.circular(14),
// //       ),
// //       child: Column(
// //         children: [
// //           Container(
// //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
// //             decoration: BoxDecoration(
// //               color: AppColors.littleBlue.withOpacity(.22),
// //               borderRadius: const BorderRadius.vertical(
// //                 top: Radius.circular(14),
// //               ),
// //             ),
// //             child: Row(
// //               textDirection: TextDirection.rtl,
// //               children: const [
// //                 _HeaderCell('الصنف'),
// //                 _HeaderCell('الأسنان'),
// //                 _HeaderCell('الكمية'),
// //                 _HeaderCell('سعر الوحدة'),
// //                 _HeaderCell('الإجمالي'),
// //               ],
// //             ),
// //           ),
// //           ...quote.lines.map((line) {
// //             return Container(
// //               padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
// //               decoration: BoxDecoration(
// //                 border: Border(
// //                   top: BorderSide(
// //                     color: AppColors.littleBlue.withOpacity(.45),
// //                   ),
// //                 ),
// //               ),
// //               child: Row(
// //                 textDirection: TextDirection.rtl,
// //                 children: [
// //                   _BodyCell(
// //                     line.compensationTypeAr.isEmpty
// //                         ? line.compensationType
// //                         : line.compensationTypeAr,
// //                   ),
// //                   _BodyCell(line.toothNumbers.join('، ')),
// //                   _BodyCell('${line.quantity}'),
// //                   _BodyCell(controller.formatPrice(line.unitPrice)),
// //                   _BodyCell(controller.formatPrice(line.lineTotal)),
// //                 ],
// //               ),
// //             );
// //           }),
// //           Container(
// //             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
// //             decoration: BoxDecoration(
// //               border: Border(
// //                 top: BorderSide(
// //                   color: AppColors.littleBlue.withOpacity(.6),
// //                 ),
// //               ),
// //             ),
// //             child: Row(
// //               textDirection: TextDirection.rtl,
// //               children: [
// //                 Text(
// //                   'المجموع التقديري',
// //                   style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
// //                     color: AppColors.darkBlue,
// //                     fontWeight: FontWeight.w800,
// //                   ),
// //                 ),
// //                 const Spacer(),
// //                 Text(
// //                   controller.formatPrice(quote.estimatedTotal),
// //                   style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
// //                     color: AppColors.darkBlue,
// //                     fontWeight: FontWeight.w800,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _HeaderCell extends StatelessWidget {
// //   final String text;

// //   const _HeaderCell(this.text);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Expanded(
// //       child: Text(
// //         text,
// //         textAlign: TextAlign.center,
// //         style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
// //           color: AppColors.darkBlue,
// //           fontWeight: FontWeight.w700,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _BodyCell extends StatelessWidget {
// //   final String text;

// //   const _BodyCell(this.text);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Expanded(
// //       child: Text(
// //         text,
// //         textAlign: TextAlign.center,
// //         maxLines: 2,
// //         overflow: TextOverflow.ellipsis,
// //         style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
// //           color: AppColors.darkBlue,
// //           fontWeight: FontWeight.w600,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _FinalPriceBox extends StatelessWidget {
// //   final CaseOrderDetailsController controller;

// //   const _FinalPriceBox({
// //     required this.controller,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final quote = controller.quote.value!;

// //     return Container(
// //       padding: const EdgeInsets.all(14),
// //       decoration: BoxDecoration(
// //         border: Border.all(
// //           color: AppColors.littleBlue.withOpacity(.6),
// //         ),
// //         borderRadius: BorderRadius.circular(14),
// //       ),
// //       child: Column(
// //         children: [
// //           Row(
// //             textDirection: TextDirection.rtl,
// //             children: [
// //               Text(
// //                 'السعر النهائي',
// //                 style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
// //                   color: AppColors.darkBlue,
// //                   fontWeight: FontWeight.w800,
// //                 ),
// //               ),
// //               const SizedBox(width: 16),
// //               Expanded(
// //                 child: TextField(
// //                   controller: controller.finalPriceController,
// //                   enabled: !quote.isPaid,
// //                   keyboardType: TextInputType.number,
// //                   textAlign: TextAlign.center,
// //                   decoration: InputDecoration(
// //                     suffixText: 'ل.س',
// //                     prefixIcon: const Icon(
// //                       Icons.edit_outlined,
// //                       size: 18,
// //                       color: AppColors.primaryBlue,
// //                     ),
// //                     contentPadding: const EdgeInsets.symmetric(
// //                       horizontal: 10,
// //                       vertical: 10,
// //                     ),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 12),
// //           Row(
// //             textDirection: TextDirection.rtl,
// //             children: [
// //               Text(
// //                 'حالة الدفع',
// //                 style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
// //                   color: AppColors.darkBlue,
// //                   fontWeight: FontWeight.w800,
// //                 ),
// //               ),
// //               const Spacer(),
// //               Container(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 12,
// //                   vertical: 7,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: quote.isPaid
// //                       ? AppColors.green.withOpacity(.1)
// //                       : AppColors.red.withOpacity(.1),
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 child: Text(
// //                   quote.isPaid ? 'مدفوع' : 'غير مدفوع',
// //                   style: AppTextStyles.ibmRegular12DarkStyle.copyWith(
// //                     color: quote.isPaid ? AppColors.green : AppColors.red,
// //                     fontWeight: FontWeight.w800,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// // class _InfoBox extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.all(14),
// //       decoration: BoxDecoration(
// //         border: Border.all(
// //           color: AppColors.littleBlue.withOpacity(.6),
// //         ),
// //         borderRadius: BorderRadius.circular(14),
// //       ),
// //       child: Text(
// //         'يتم حساب هذه الفاتورة بناءً على أسعار أنواع التعويضات التي أدخلها المخبر في الملف الشخصي.',
// //         textAlign: TextAlign.right,
// //         style: AppTextStyles.ibmRegular14NeutralStyle.copyWith(
// //           color: AppColors.textDark,
// //           height: 1.8,
// //         ),
// //       ),
// //     );
// //   }
// // }