import 'package:flutter/material.dart';
import 'package:template/Dentist/InvoicesPage/view/InvoicePageWidgets/invoice_payment_body.dart';

class InvoicePaymentScreen extends StatelessWidget {
  const InvoicePaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InvoicePaymentBody(),
    );
  }
}
