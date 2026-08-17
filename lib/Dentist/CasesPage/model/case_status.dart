import 'dart:ui';

enum CaseStatus {
  waitingApproval,
  accepted,
  needInfo,
  inDesign,
  inProgress,
  ready,
  delivered,
  cancelled,
  inColoring,
  waitingForClarification;

  static Color getColor(CaseStatus status) {
    switch (status) {
      case CaseStatus.waitingApproval:
        return const Color(0xFFFFA500); // Orange
      case CaseStatus.accepted:
        return const Color(0xFF008000); // Green
      case CaseStatus.needInfo:
        return const Color(0xFFFF0000); // Red
      case CaseStatus.inDesign:
        return const Color(0xFF0000FF); // Blue
      case CaseStatus.inProgress:
        return const Color(0xFF800080); // Purple
      case CaseStatus.ready:
        return const Color.fromARGB(255, 0, 78, 78); // Cyan
      case CaseStatus.delivered:
        return const Color(0xFF808080); // Gray
      case CaseStatus.cancelled:
        return const Color(0xFFFF0000); // Red
      case CaseStatus.inColoring:
        return const Color(0xFFFFC0CB); // Pink
      case CaseStatus.waitingForClarification:
        return const Color(0xFFFFFF00); // Yellow
    }
  }

  static CaseStatus getStatusFromString(String? status) {
    switch (status) {
      case 'Pennding':
        return CaseStatus.waitingApproval;
      case 'Accepted':
        return CaseStatus.accepted;
      case 'NeedInfo':
        return CaseStatus.needInfo;
      case 'InDesign':
        return CaseStatus.inDesign;
      case 'InProgress':
        return CaseStatus.inProgress;
      case 'Ready':
        return CaseStatus.ready;
      case 'Delivered':
        return CaseStatus.delivered;
      case 'Cancelled':
        return CaseStatus.cancelled;
      case 'InColoring':
        return CaseStatus.inColoring;
      case 'WaitingForClarification':
        return CaseStatus.waitingForClarification;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }
}
