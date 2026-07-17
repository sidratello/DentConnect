import 'package:get/get.dart';

import '../model/case_model.dart';
import '../model/case_status.dart';

class CaseController extends GetxController {
  final expandedSections = <CaseStatus, bool>{
    CaseStatus.waitingApproval: true,
    CaseStatus.accepted: true,
    CaseStatus.needInfo: true,
    CaseStatus.inDesign: true,
    CaseStatus.inProgress: true,
    CaseStatus.ready: true,
    CaseStatus.delivered: true,
    CaseStatus.cancelled: true,
  }.obs;

  final visibleCount = <CaseStatus, int>{
    CaseStatus.waitingApproval: 3,
    CaseStatus.accepted: 3,
    CaseStatus.needInfo: 3,
    CaseStatus.inDesign: 3,
    CaseStatus.inProgress: 3,
    CaseStatus.ready: 3,
    CaseStatus.delivered: 3,
    CaseStatus.cancelled: 3,
  }.obs;

  void toggleSection(
    CaseStatus status,
  ) {
    expandedSections[status] = !(expandedSections[status] ?? true);

    expandedSections.refresh();
  }

  void showMore(
    CaseStatus status,
    int total,
  ) {
    visibleCount[status] = total;

    visibleCount.refresh();
  }

  final cases = <CaseModel>[
    const CaseModel(
      id: 1,
      imagePath: 'assets/images/case_image.png',
      compensationName: 'ZIRCON 3D',
      compensationDescription:
          'تعويض زيركون ثلاثي الأبعاد بدقة عالية ومظهر جمالي ممتاز.',
      price: '60\$',
      rating: 4.8,
      status: CaseStatus.waitingApproval,
    ),
    const CaseModel(
      id: 2,
      imagePath: 'assets/images/case_image.png',
      compensationName: 'EMAX',
      compensationDescription:
          'تعويض خزفي عالي الشفافية مناسب للأسنان الأمامية.',
      price: '90\$',
      rating: 4.6,
      status: CaseStatus.accepted,
    ),
    const CaseModel(
      id: 3,
      imagePath: 'assets/images/case_image.png',
      compensationName: 'VENEER',
      compensationDescription: 'فينير تجميلي لإعطاء ابتسامة طبيعية ومميزة.',
      price: '75\$',
      rating: 4.7,
      status: CaseStatus.needInfo,
    ),
    const CaseModel(
      id: 10,
      imagePath: 'assets/images/case_image.png',
      compensationName: 'ZIRCON 3D',
      compensationDescription: 'تعويض زيركون ثلاثي الأبعاد بدقة عالية.',
      price: '60\$',
      rating: 4.8,
      status: CaseStatus.delivered,
      isRated: false,
    ),
  ].obs;

  List<CaseModel> getCases(
    CaseStatus status,
  ) {
    return cases
        .where(
          (e) => e.status == status,
        )
        .toList();
  }
}
