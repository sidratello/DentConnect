import 'package:flutter/material.dart';
import 'package:template/core/utils/static.dart';

class LabsListView extends StatelessWidget {
  final bool isPreviewMode;

  const LabsListView({
    super.key,
    required this.isPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Static.getwidth(context, 24),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Static.getwidth(context, 12),
          mainAxisSpacing: Static.getheight(context, 14),
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return LabCard(
            isFollowing: index.isEven,
            isPreviewMode: isPreviewMode,
          );
        },
      ),
    );
  }
}

class LabCard extends StatelessWidget {
  final bool isFollowing;
  final bool isPreviewMode;

  const LabCard({
    super.key,
    required this.isFollowing,
    required this.isPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
            child: Image.asset(
              'assets/images/lab_card.png',
              width: double.infinity,
              height: Static.getheight(context, 110),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwidth(context, 10),
              vertical: Static.getheight(context, 10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: Static.getwidth(context, 18),
                        ),
                        SizedBox(
                          width: Static.getwidth(context, 2),
                        ),
                        Text(
                          '4.2',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w500,
                            fontSize: Static.getwidth(context, 13),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        'مخبر هشام',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans Arabic',
                          fontWeight: FontWeight.w500,
                          fontSize: Static.getwidth(context, 14),
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                if (!isPreviewMode) ...[
                  SizedBox(
                    height: Static.getheight(context, 18),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: Static.getheight(context, 9),
                    ),
                    decoration: BoxDecoration(
                      color: isFollowing
                          ? const Color.fromRGBO(
                              0,
                              200,
                              83,
                              0.08,
                            )
                          : const Color.fromRGBO(
                              61,
                              114,
                              255,
                              0.08,
                            ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isFollowing
                            ? const Color.fromRGBO(
                                0,
                                200,
                                83,
                                1,
                              )
                            : const Color.fromRGBO(
                                61,
                                114,
                                255,
                                1,
                              ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isFollowing
                              ? Icons.check_rounded
                              : Icons.person_add_alt_1_rounded,
                          color: isFollowing
                              ? const Color.fromRGBO(
                                  0,
                                  200,
                                  83,
                                  1,
                                )
                              : const Color.fromRGBO(
                                  61,
                                  114,
                                  255,
                                  1,
                                ),
                          size: Static.getwidth(context, 18),
                        ),
                        SizedBox(
                          width: Static.getwidth(context, 6),
                        ),
                        Text(
                          isFollowing ? 'متابع' : 'متابعة',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w500,
                            fontSize: Static.getwidth(context, 13),
                            color: isFollowing
                                ? const Color.fromRGBO(
                                    0,
                                    200,
                                    83,
                                    1,
                                  )
                                : const Color.fromRGBO(
                                    61,
                                    114,
                                    255,
                                    1,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
