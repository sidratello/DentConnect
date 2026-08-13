class PaymentLinkResponse {
  final String paymentLink;
  final String message;

  const PaymentLinkResponse({
    required this.paymentLink,
    required this.message,
  });

  factory PaymentLinkResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return PaymentLinkResponse(
      paymentLink:
          json['paymentLink']?.toString() ?? '',
      message:
          json['message']?.toString() ?? '',
    );
  }
}