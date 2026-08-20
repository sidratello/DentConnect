class SubscriptionPaymentModel {
  final String paymentUrl;
  final int months;
  final double monthlyPrice;
  final double totalAmount;
  final DateTime? periodStartUtc;
  final DateTime? periodEndUtc;
  final String message;

  const SubscriptionPaymentModel({
    required this.paymentUrl,
    required this.months,
    required this.monthlyPrice,
    required this.totalAmount,
    required this.periodStartUtc,
    required this.periodEndUtc,
    required this.message,
  });

  factory SubscriptionPaymentModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SubscriptionPaymentModel(
      paymentUrl:
          json['paymentUrl']
                  ?.toString()
                  .trim() ??
              '',
      months:
          (json['months'] as num?)
                  ?.toInt() ??
              0,
      monthlyPrice:
          (json['monthlyPrice'] as num?)
                  ?.toDouble() ??
              0,
      totalAmount:
          (json['totalAmount'] as num?)
                  ?.toDouble() ??
              0,
      periodStartUtc:
          DateTime.tryParse(
        json['periodStartUtc']
                ?.toString() ??
            '',
      ),
      periodEndUtc:
          DateTime.tryParse(
        json['periodEndUtc']
                ?.toString() ??
            '',
      ),
      message:
          json['message']
                  ?.toString()
                  .trim() ??
              '',
    );
  }
}