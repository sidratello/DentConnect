import 'template_model.dart';

class TemplateData {
  static const List<CaseTemplate> templates = [
    CaseTemplate(
      id: 1,
      title: 'Zircon Crown قالب',
      workType: 'Single Crown',
      materials: [
        'زيركون متعدد الطبقات',
        'خزف تجميلي',
        'صبغات تلوين',
      ],
      defaultShade: 'A2',
      preferredImpression: 'طبعة رقمية',
      requiredImages: [
        'صورة أمامية',
        'صورة جانبية',
        'صورة Shade',
      ],
      deliveryDays: 5,
      notes: [
        'مراعاة الإطباق',
        'حواف دقيقة',
        'شكل طبيعي',
      ],
      isUrgent: false,
      needsTryIn: false,
    ),
    CaseTemplate(
      id: 2,
      title: 'Veneer Case قالب',
      workType: 'Veneer',
      materials: [
        'E.max',
        'لاصق تجميلي',
        'خزف ليثيوم',
      ],
      defaultShade: 'BL3',
      preferredImpression: 'طبعة رقمية',
      requiredImages: [
        'ابتسامة كاملة',
        'صورة أمامية',
        'صورة Shade',
      ],
      deliveryDays: 7,
      notes: [
        'الاهتمام بالشفافية',
        'الحواف غير مرئية',
        'تناسق اللون',
      ],
      isUrgent: false,
      needsTryIn: true,
    ),
    CaseTemplate(
      id: 3,
      title: 'Implant Crown قالب',
      workType: 'Implant Crown',
      materials: [
        'زيركون',
        'قاعدة تيتانيوم',
        'خزف تجميلي',
      ],
      defaultShade: 'A2',
      preferredImpression: 'طبعة رقمية',
      requiredImages: [
        'Radiograph',
        'صورة أمامية',
        'صورة جانبية',
      ],
      deliveryDays: 6,
      notes: [
        'التحقق من محور الزرعة',
        'إطباق صحيح',
        'Emergence Profile',
      ],
      isUrgent: false,
      needsTryIn: true,
    ),
    CaseTemplate(
      id: 4,
      title: 'Bridge قالب',
      workType: 'Bridge',
      materials: [
        'زيركون',
        'خزف',
        'إسمنت دائم',
      ],
      defaultShade: 'A2',
      preferredImpression: 'طبعة تقليدية',
      requiredImages: [
        'صورة أمامية',
        'صورة جانبية',
        'Opposing Arch',
      ],
      deliveryDays: 8,
      notes: [
        'التأكد من نقاط التماس',
        'جمالية الأسنان الأمامية',
        'إطباق مستقر',
      ],
      isUrgent: false,
      needsTryIn: true,
    ),
    CaseTemplate(
      id: 5,
      title: 'Temporary Crown قالب',
      workType: 'Temporary Crown',
      materials: [
        'PMMA',
        'راتنج أكريلي',
      ],
      defaultShade: 'A2',
      preferredImpression: 'طبعة رقمية',
      requiredImages: [
        'صورة أمامية',
      ],
      deliveryDays: 2,
      notes: [
        'الحفاظ على الإطباق',
        'سهولة الإزالة',
      ],
      isUrgent: true,
      needsTryIn: false,
    ),
    CaseTemplate(
      id: 6,
      title: 'Full Denture قالب',
      workType: 'Complete Denture',
      materials: [
        'أكريل',
        'أسنان صناعية',
        'شمع تجريبي',
      ],
      defaultShade: 'A2',
      preferredImpression: 'طبعة تقليدية',
      requiredImages: [
        'صورة أمامية',
        'صورة جانبية',
        'صورة الابتسامة',
      ],
      deliveryDays: 10,
      notes: [
        'تحديد خط الابتسامة',
        'تحديد الـ Midline',
        'التحقق من الـ Vertical Dimension',
      ],
      isUrgent: false,
      needsTryIn: true,
    ),
  ];
}
