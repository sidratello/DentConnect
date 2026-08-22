import 'package:flutter/material.dart';

import 'package:template/core/widgets/app_note_card.dart';


class PostStatusCard extends StatelessWidget {
  final String status;
  final String? reviewMessage;

  const PostStatusCard({
    super.key,
    required this.status,
    this.reviewMessage,
  });

  @override
  Widget build(BuildContext context) {
    final ui = _getStatusUi();

    return AppNoteCard(
      icon: ui.icon,
      color: ui.color,
      backgroundColor: ui.backgroundColor,
      borderColor: ui.borderColor,
      textColor: ui.textColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      borderRadius: 14,
      messages: [
        reviewMessage?.trim().isNotEmpty == true
            ? reviewMessage!.trim()
            : ui.message,
      ],
    );
  }

  _StatusUi _getStatusUi() {
    switch (status.toLowerCase()) {
      case 'approved':
        return const _StatusUi(
          icon: Icons.check_circle_outline_rounded,
          color: Color(0xFF16A34A),
          backgroundColor: Color(0xFFEFFAF3),
          borderColor: Color(0xFFB7E4C7),
          textColor: Color(0xFF166534),
          message: 'تمت الموافقة على هذا المنشور.',
        );

      case 'rejected':
        return const _StatusUi(
          icon: Icons.cancel_outlined,
          color: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFFF1F2),
          borderColor: Color(0xFFFECACA),
          textColor: Color(0xFF991B1B),
          message: 'تم رفض هذا المنشور.',
        );

      case 'pending':
      default:
        return const _StatusUi(
          icon: Icons.schedule_rounded,
          color: Color(0xFFE9A700),
          backgroundColor: Color(0xFFFFF7E1),
          borderColor: Color(0xFFFFD97D),
          textColor: Color(0xFF9D7000),
          message:
              'منشوراتك في انتظار مراجعة الأدمن، وسيتم إشعارك عند الموافقة أو الرفض.',
        );
    }
  }
}

class _StatusUi {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String message;

  const _StatusUi({
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.message,
  });
}