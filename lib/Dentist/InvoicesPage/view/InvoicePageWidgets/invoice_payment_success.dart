import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:template/core_dentist/theme/app_colors.dart';

class InvoicePaymentSuccessScreen extends StatelessWidget {
  const InvoicePaymentSuccessScreen({
    super.key,
  });

  void _handleSuccess() {
    Get.back(
      result: 'paymentSuccess',
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (
        didPop,
        result,
      ) {
        if (didPop) {
          return;
        }

        _handleSuccess();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(
                        alpha: .12,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 58,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    'تم الدفع بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'تم استلام دفعة الطلبية بنجاح.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _handleSuccess,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: const Text(
                        'العودة إلى الفواتير',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
