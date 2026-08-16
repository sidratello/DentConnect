class InvoiceTableItem {
  final String compensationType;
  final String toothNumbers;

  final int quantity;

  final double unitPrice;
  final double lineTotal;

  final bool priceMissing;

  const InvoiceTableItem({
    required this.compensationType,
    required this.toothNumbers,
    required this.quantity,
    required this.unitPrice,
    required this.lineTotal,
    required this.priceMissing,
  });
}