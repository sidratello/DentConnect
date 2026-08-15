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
