class LabSubscriptionStatusModel {
  final bool isActive;
  final bool isFreeTrial;
  final DateTime? subscriptionStartUtc;
  final DateTime? subscriptionEndUtc;
  final int remainingDays;
  final double monthlyPrice;

  const LabSubscriptionStatusModel({
    required this.isActive,
    required this.isFreeTrial,
    required this.subscriptionStartUtc,
    required this.subscriptionEndUtc,
    required this.remainingDays,
    required this.monthlyPrice,
  });

  factory LabSubscriptionStatusModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LabSubscriptionStatusModel(
      isActive:
          json['isActive'] ?? false,
      isFreeTrial:
          json['isFreeTrial'] ?? false,
      subscriptionStartUtc:
          DateTime.tryParse(
        json['subscriptionStartUtc']
                ?.toString() ??
            '',
      ),
      subscriptionEndUtc:
          DateTime.tryParse(
        json['subscriptionEndUtc']
                ?.toString() ??
            '',
      ),
      remainingDays:
          (json['remainingDays'] as num?)
                  ?.toInt() ??
              0,
      monthlyPrice:
          (json['monthlyPrice'] as num?)
                  ?.toDouble() ??
              0,
    );
  }
}