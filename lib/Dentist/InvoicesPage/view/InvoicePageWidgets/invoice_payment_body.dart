import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:template/Dentist/InvoicesPage/controller/invoice_payment_controller.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';

class InvoicePaymentBody extends StatefulWidget {
  const InvoicePaymentBody({
    super.key,
  });

  @override
  State<InvoicePaymentBody> createState() => _InvoicePaymentBodyState();
}

class _InvoicePaymentBodyState extends State<InvoicePaymentBody> {
  late final WebViewController _webViewController;

  late final InvoicePaymentController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.find<InvoicePaymentController>();

    _webViewController = WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setBackgroundColor(
        AppColors.white,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            controller.setLoading(
              true,
            );
          },
          onPageFinished: (_) {
            controller.setLoading(
              false,
            );
          },
          onWebResourceError: (_) {
            controller.setLoading(
              false,
            );
          },
          onNavigationRequest: (
            NavigationRequest request,
          ) {
            final url = request.url;

            debugPrint(
              'Payment navigation: $url',
            );

            final uri = Uri.tryParse(url);

            if (uri != null &&
                uri.path.toLowerCase().contains(
                      '/api/payment/callback',
                    )) {
              controller.handlePaymentCallback(
                url,
              );

              if (uri != null &&
                  uri.path.toLowerCase().contains(
                        '/api/payment/callback',
                      )) {
                controller.handlePaymentCallback(url);

                return NavigationDecision.navigate;
              }
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          controller.paymentUrl,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: _webViewController,
        ),
        Obx(
          () {
            if (!controller.isPageLoading.value) {
              return const SizedBox.shrink();
            }

            return Container(
              color: AppColors.white,
              alignment: Alignment.center,
              child: const AppLoadingIndicator(
                size: 32,
              ),
            );
          },
        ),
      ],
    );
  }
}
