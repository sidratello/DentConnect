import 'package:flutter/material.dart';

import '../utils/static.dart';

class AppCaseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Widget bottomWidget;
  final Widget? topWidget;

  const AppCaseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.bottomWidget,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Static.getheight(context, 140),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(232, 232, 232, 0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: Static.getwidth(context, 120),
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Static.getwidth(context, 12),
                vertical: Static.getheight(context, 10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w600,
                          fontSize: Static.getwidth(context, 18),
                          color: const Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      if (topWidget != null) topWidget!,
                    ],
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans Arabic',
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwidth(context, 14),
                      height: 21 / 14,
                      color: const Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                  bottomWidget,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
