class OrderQuoteModel {
  final int orderId;
  final String orderTitle;
  final String dentistName;
  final DateTime? deliveryDate;
  final bool isUrgent;
  final List<QuoteLineModel> lines;
  final double estimatedTotal;
  final double? finalPrice;
  final bool isPaid;
  final String notes;

  OrderQuoteModel({
    required this.orderId,
    required this.orderTitle,
    required this.dentistName,
    required this.deliveryDate,
    required this.isUrgent,
    required this.lines,
    required this.estimatedTotal,
    required this.finalPrice,
    required this.isPaid,
    required this.notes,
  });

  factory OrderQuoteModel.fromJson(Map<String, dynamic> json) {
    return OrderQuoteModel(
      orderId: json['orderId'] ?? 0,
      orderTitle: (json['orderTitle'] ?? '').toString(),
      dentistName: (json['dentistName'] ?? '').toString(),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.tryParse(json['deliveryDate'].toString()),
      isUrgent: json['isUrgent'] ?? false,
      lines: (json['lines'] as List?)
              ?.map((e) => QuoteLineModel.fromJson(e))
              .toList() ??
          [],
      estimatedTotal: (json['estimatedTotal'] ?? 0).toDouble(),
      finalPrice: json['finalPrice'] == null
          ? null
          : (json['finalPrice'] as num).toDouble(),
      isPaid: json['isPaid'] ?? false,
      notes: (json['notes'] ?? '').toString(),
    );
  }
}

class QuoteLineModel {
  final String compensationType;
  final String compensationTypeAr;
  final int quantity;
  final List<int> toothNumbers;
  final double unitPrice;
  final double lineTotal;
  final bool priceFound;

  QuoteLineModel({
    required this.compensationType,
    required this.compensationTypeAr,
    required this.quantity,
    required this.toothNumbers,
    required this.unitPrice,
    required this.lineTotal,
    required this.priceFound,
  });

  factory QuoteLineModel.fromJson(Map<String, dynamic> json) {
    return QuoteLineModel(
      compensationType: (json['compensationType'] ?? '').toString(),
      compensationTypeAr: (json['compensationTypeAr'] ?? '').toString(),
      quantity: json['quantity'] ?? 0,
      toothNumbers:
          (json['toothNumbers'] as List?)?.map((e) => e as int).toList() ?? [],
      unitPrice: (json['unitPrice'] ?? 0).toDouble(),
      lineTotal: (json['lineTotal'] ?? 0).toDouble(),
      priceFound: json['priceFound'] ?? false,
    );
  }
}