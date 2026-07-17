import '../model/case_details_model.dart';

const dummyCaseDetails = CaseDetailsModel(
  patientName: 'أحمد محمد',
  images: [
    'assets/images/case_image.png',
    'assets/images/case_image.png',
    'assets/images/case_image.png',
  ],
  teethNumbers: '11 - 12',
  restorationType: 'زيركون',
  color: 'A2',
  impressionType: 'Scanner',
  shortDescription:
      'حالة تعويض ثابت للأسنان الأمامية مع المحافظة على المظهر الطبيعي للأسنان.',
  doctorRating: 4.8,
  price: 180,
  hasTemplate: true,
  templateName: 'قالب زيركون',
  hasAccessory: true,
  isUrgent: true,
  sentDate: '12 / 06 / 2026',
  deliveryDate: '18 / 06 / 2026',
  notes: 'يرجى المحافظة على نقاط التماس وإرسال صور نهائية قبل التسليم.',
  status: 'قيد التنفيذ',
  caseNumber: '#2541',
);
