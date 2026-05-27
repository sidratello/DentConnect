import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class HomeAdsSlider extends StatelessWidget {
  const HomeAdsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Static.getwidth(context, 380),
          height: Static.getheight(context, 180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/adverstisements.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: Static.getheight(context, 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDot(isActive: true, context),
            _buildDot(context),
            _buildDot(context),
          ],
        ),
      ],
    );
  }

  Widget _buildDot(BuildContext context, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width:
          isActive ? Static.getwidth(context, 10) : Static.getwidth(context, 8),
      height: isActive
          ? Static.getheight(context, 10)
          : Static.getheight(context, 8),
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 0, 0, 253) : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
