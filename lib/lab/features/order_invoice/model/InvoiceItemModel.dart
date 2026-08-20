class LabInvoicesResponse {
  final List<OrderInvoiceModel> orderInvoices;
  final List<AdInvoiceModel> adInvoices;

  const LabInvoicesResponse({
    required this.orderInvoices,
    required this.adInvoices,
  });

  factory LabInvoicesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return LabInvoicesResponse(
      orderInvoices:
          (json['orderInvoices'] as List? ?? [])
              .map(
                (item) =>
                    OrderInvoiceModel.fromJson(
                  Map<String, dynamic>.from(
                    item,
                  ),
                ),
              )
              .toList(),
      adInvoices:
          (json['adInvoices'] as List? ?? [])
              .map(
                (item) =>
                    AdInvoiceModel.fromJson(
                  Map<String, dynamic>.from(
                    item,
                  ),
                ),
              )
              .toList(),
    );
  }
}

// =====================================================
// Order Invoice
// =====================================================

class OrderInvoiceModel {
  final int invoiceId;
  final int caseOrderId;

  final String caseOrderTitle;
  final String dentistName;

  final double finalPrice;
  final double totalAmount;

  final DateTime? paidAt;

  final List<InvoiceItemModel> items;

  const OrderInvoiceModel({
    required this.invoiceId,
    required this.caseOrderId,
    required this.caseOrderTitle,
    required this.dentistName,
    required this.finalPrice,
    required this.totalAmount,
    required this.paidAt,
    required this.items,
  });

  factory OrderInvoiceModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrderInvoiceModel(
      invoiceId:
          (json['invoiceId'] as num?)?.toInt() ??
              0,

      caseOrderId:
          (json['caseOrderId'] as num?)?.toInt() ??
              0,

      caseOrderTitle:
          json['caseOrderTitle']
                  ?.toString()
                  .trim() ??
              '',

      dentistName:
          json['dentistName']
                  ?.toString()
                  .trim() ??
              '',

      finalPrice:
          (json['finalPrice'] as num?)
                  ?.toDouble() ??
              0,

      totalAmount:
          (json['totalAmount'] as num?)
                  ?.toDouble() ??
              0,

      paidAt: DateTime.tryParse(
        json['paidAt']?.toString() ?? '',
      ),

      items: (json['items'] as List? ?? [])
          .map(
            (item) =>
                InvoiceItemModel.fromJson(
              Map<String, dynamic>.from(
                item,
              ),
            ),
          )
          .toList(),
    );
  }
}

// =====================================================
// Invoice Item
// =====================================================

class InvoiceItemModel {
  final String compensationType;
  final String toothNumbers;

  final double unitPrice;
  final int teethCount;
  final double lineTotal;

  final String? priceNote;

  const InvoiceItemModel({
    required this.compensationType,
    required this.toothNumbers,
    required this.unitPrice,
    required this.teethCount,
    required this.lineTotal,
    required this.priceNote,
  });

  /// حسب الـ API عندك:
  ///
  /// unitPrice = 0
  /// lineTotal = 0
  ///
  /// تعني أن المختبر لم يحدد السعر.
  bool get priceMissing =>
      unitPrice == 0 && lineTotal == 0;

  factory InvoiceItemModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return InvoiceItemModel(
      compensationType:
          json['compensationType']
                  ?.toString()
                  .trim() ??
              '',

      toothNumbers:
          json['toothNumbers']
                  ?.toString()
                  .trim() ??
              '',

      unitPrice:
          (json['unitPrice'] as num?)
                  ?.toDouble() ??
              0,

      teethCount:
          (json['teethCount'] as num?)
                  ?.toInt() ??
              0,

      lineTotal:
          (json['lineTotal'] as num?)
                  ?.toDouble() ??
              0,

      priceNote:
          json['priceNote']?.toString(),
    );
  }
}

// =====================================================
// Advertisement Invoice
// =====================================================

class AdInvoiceModel {
  final int advertisementId;

  final String adTitle;
  final String adContent;

  final double price;

  final DateTime? paidAt;

  const AdInvoiceModel({
    required this.advertisementId,
    required this.adTitle,
    required this.adContent,
    required this.price,
    required this.paidAt,
  });

  factory AdInvoiceModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AdInvoiceModel(
      advertisementId:
          (json['advertisementId'] as num?)
                  ?.toInt() ??
              0,

      adTitle:
          json['adTitle']?.toString().trim() ??
              '',

      adContent:
          json['adContent']
                  ?.toString()
                  .trim() ??
              '',

      price:
          (json['price'] as num?)?.toDouble() ??
              0,

      paidAt: DateTime.tryParse(
        json['paidAt']?.toString() ?? '',
      ),
    );
  }
}