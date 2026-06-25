class OrderTextHelper {
  static String arabicImpressionType(String value) {
    switch (value) {
      case 'Digital':
        return 'طبعة رقمية';
      case 'Traditional':
        return 'طبعة تقليدية';
      default:
        return value;
    }
  }




  static String arabicImpressionStage(String value) {
    switch (value) {
      case 'FinalImpression':
        return 'مرحلة نهائية';
      case 'PlasticImpression':
        return 'مرحلة بلاستيكية';
      default:
        return value;
    }
  }
}