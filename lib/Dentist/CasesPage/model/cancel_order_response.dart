class CancelOrderResponse {
  final String message;
  final String details;
  final double refundAmount;

  const CancelOrderResponse({
    required this.message,
    required this.details,
    required this.refundAmount,
  });

  factory CancelOrderResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CancelOrderResponse(
      message: json['message']?.toString() ?? '',
      details: json['details']?.toString() ?? '',
      refundAmount: (json['refundAmount'] as num?)?.toDouble() ?? 0,
    );
  }
}
