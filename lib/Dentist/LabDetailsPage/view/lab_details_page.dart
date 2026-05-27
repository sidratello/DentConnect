import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class LabDetailsPage extends StatelessWidget {
  const LabDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// الخلفية الأساسية
          SizedBox(
            width: double.infinity,
            height: Static.getheight(context, 260),
            child: Stack(
              children: [
                /// الصورة الأساسية
                Image.asset(
                  'assets/images/lab_card.png',
                  width: double.infinity,
                  height: Static.getheight(context, 260),
                  fit: BoxFit.cover,
                ),

                /// التدرج الأبيض
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Static.getheight(context, 120),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.5),
                          Colors.white,
                        ],
                        stops: const [
                          0,
                          0.3,
                          0.7,
                          1,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// زر الرجوع
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: Static.getheight(context, 16),
                right: Static.getwidth(context, 24),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/vector_back.png',
                    width: Static.getwidth(context, 32),
                    height: Static.getheight(context, 37.57),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
