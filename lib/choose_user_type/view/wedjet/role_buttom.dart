// class _RoleButton extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;

//   const _RoleButton({
//     required this.title,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0.96, end: 1),
//       duration: const Duration(milliseconds: 350),
//       curve: Curves.easeOut,
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: value,
//           child: child,
//         );
//       },
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(18),
//           child: Ink(
//             height: 56,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [
//                   Color(0xFF8DB6FF),
//                   Color(0xFF5A92FF),
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(18),
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.primaryBlue.withOpacity(0.20),
//                   blurRadius: 14,
//                   offset: const Offset(0, 7),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   icon,
//                   color: AppColors.white,
//                   size: 23,
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   title,
//                   style: AppTextStyles.ibmRegular16WhiteStyle.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }