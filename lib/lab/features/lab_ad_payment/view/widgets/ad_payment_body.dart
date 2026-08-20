import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/lab/features/lab_ad_payment/controller/ad_payment_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:template/core/app_colors.dart';
import 'package:template/core/widgets/AppLoadingIndicator.dart';


class LabAdPaymentBody
    extends StatefulWidget {
  const LabAdPaymentBody({
    super.key,
  });

  @override
  State<LabAdPaymentBody>
      createState() =>
          _LabAdPaymentBodyState();
}

class _LabAdPaymentBodyState
    extends State<LabAdPaymentBody> {
  late final WebViewController
      _webViewController;

  late final LabAdPaymentController
      controller;

  @override
  void initState() {
    super.initState();

    controller =
        Get.find<
            LabAdPaymentController>();

   _webViewController =
    WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setBackgroundColor(
        AppColors.white,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            controller.setLoading(true);
          },

          onPageFinished: (_) {
            controller.setLoading(false);
          },

          onWebResourceError: (error) {
            controller.setLoading(false);
          },

       onNavigationRequest: (
  NavigationRequest request,
) {
  final url = request.url;

  debugPrint(
    'Payment navigation: $url',
  );

  if (url.contains(
    '/payment-success',
  )) {
    controller.handlePaymentSuccess(
      url,
    );

    return NavigationDecision.prevent;
  }

  if (url.contains(
        '/payment-failed',
      ) ||
      url.contains(
        '/api/payment/error',
      )) {
    controller.handlePaymentFailure(
      url,
    );

    return NavigationDecision.prevent;
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
    return 
  
   

   
       Stack(
            children: [
              WebViewWidget(
                controller:
                    _webViewController,
              ),

              Obx(
                () {
                  if (!controller
                      .isPageLoading.value) {
                    return const SizedBox
                        .shrink();
                  }

                  return Container(
                    color:
                        AppColors.white,
                    alignment:
                        Alignment.center,
                    child:
                        const AppLoadingIndicator(
                      size: 32,
                    ),
                  );
                },
              ),
            ],
          
        
      
    );
  }
}