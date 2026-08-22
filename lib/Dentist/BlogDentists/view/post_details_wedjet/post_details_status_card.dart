import 'package:flutter/material.dart';

import 'package:template/core/widgets/app_note_card.dart';

class PostDoctorStatusCard extends StatelessWidget {
  final String status;
  final String? reviewMessage;

  const PostDoctorStatusCard({
    super.key,
    required this.status,
    this.reviewMessage,
  });

  @override
  Widget build(BuildContext context) {
    final ui = _statusUi;

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
            : ui.defaultMessage,
      ],
    );
  }

  _PostStatusUi get _statusUi {
    switch (status.toLowerCase()) {
      case 'approved':
        return const _PostStatusUi(
          icon: Icons.check_circle_outline_rounded,
          color: Color(0xFF16A34A),
          backgroundColor: Color(0xFFEFFAF3),
          borderColor: Color(0xFFB7E4C7),
          textColor: Color(0xFF166534),
          defaultMessage:
              'تمت الموافقة على المنشور وهو الآن ظاهر لجميع المستخدمين.',
        );

      case 'rejected':
        return const _PostStatusUi(
          icon: Icons.cancel_outlined,
          color: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFFF1F2),
          borderColor: Color(0xFFFECACA),
          textColor: Color(0xFF991B1B),
          defaultMessage:
              'تم رفض هذا المنشور من قبل الأدمن.',
        );

      case 'pending':
      default:
        return const _PostStatusUi(
          icon: Icons.schedule_rounded,
          color: Color(0xFFE9A700),
          backgroundColor: Color(0xFFFFF7E1),
          borderColor: Color(0xFFFFD97D),
          textColor: Color(0xFF9D7000),
          defaultMessage:
              'المنشور معلق بانتظار موافقة الأدمن ليتم نشره في العلن.',
        );
    }
  }
}

class _PostStatusUi {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String defaultMessage;

  const _PostStatusUi({
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.defaultMessage,
  });
}