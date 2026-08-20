class SubscriptionPriceInfoModel {
  final double monthlyPrice;
  final bool isActive;
  final DateTime? currentSubscriptionEndUtc;
  final int remainingDays;
  final List<SubscriptionPriceTierModel>
      priceTiers;

  const SubscriptionPriceInfoModel({
    required this.monthlyPrice,
    required this.isActive,
    required this.currentSubscriptionEndUtc,
    required this.remainingDays,
    required this.priceTiers,
  });

  factory SubscriptionPriceInfoModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SubscriptionPriceInfoModel(
      monthlyPrice:
          (json['monthlyPrice'] as num?)
                  ?.toDouble() ??
              0,
      isActive:
          json['isActive'] ?? false,
      currentSubscriptionEndUtc:
          DateTime.tryParse(
        json['currentSubscriptionEndUtc']
                ?.toString() ??
            '',
      ),
      remainingDays:
          (json['remainingDays'] as num?)
                  ?.toInt() ??
              0,
      priceTiers:
          (json['priceTiers'] as List?)
                  ?.map(
                    (item) =>
                        SubscriptionPriceTierModel
                            .fromJson(
                      Map<String, dynamic>.from(
                        item,
                      ),
                    ),
                  )
                  .toList() ??
              [],
    );
  }
}

class SubscriptionPriceTierModel {
  final int months;
  final double totalAmount;
  final DateTime? newPeriodEndUtc;

  const SubscriptionPriceTierModel({
    required this.months,
    required this.totalAmount,
    required this.newPeriodEndUtc,
  });

  factory SubscriptionPriceTierModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SubscriptionPriceTierModel(
      months:
          (json['months'] as num?)
                  ?.toInt() ??
              0,
      totalAmount:
          (json['totalAmount'] as num?)
                  ?.toDouble() ??
              0,
      newPeriodEndUtc:
          DateTime.tryParse(
        json['newPeriodEndUtc']
                ?.toString() ??
            '',
      ),
    );
  }
}