import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // =========================
  // Base Colors
  // =========================

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  static const Color textDark = Color(0xFF333333);

  static const Color black54 = Colors.black54;

  // =========================
  // Backgrounds
  // =========================

  static const Color background = Color(0xFFECF2FE);

  static const Color backgroundColor = Color.fromRGBO(
    248,
    250,
    255,
    1,
  );

  static const Color card = Color(0xFFFFFFFF);

  static const Color primaryLightBackground = Color.fromRGBO(
    54,
    122,
    255,
    0.1,
  );

  static const Color littleBlue = Color(0xFFCCDDFF);

  // =========================
  // Primary Brand
  // =========================

  static const Color primary = Color.fromRGBO(
    54,
    122,
    255,
    1,
  );

  static const Color primaryBlue = Color(0xFF075AFF);

  static const Color primary200 = Color(0xFF9DBCFD);

  static const Color priceBlue = Color(0xFF075AFF);

  static const Color darkBlue = Color(0xFF071B4D);

  // =========================
  // Text Colors
  // =========================

  static const Color textPrimary = Color.fromRGBO(
    51,
    51,
    51,
    1,
  );

  static const Color textSecondary = Color.fromRGBO(
    96,
    96,
    96,
    1,
  );

  static const Color greyColor = Color.fromRGBO(
    120,
    120,
    120,
    1,
  );

  static const Color neutral1000 = Color(0xFF1E1E1E);

  // =========================
  // Borders & Dividers
  // =========================

  static const Color border = Color.fromRGBO(
    232,
    236,
    242,
    1,
  );

  static const Color borderBlack = Color.fromRGBO(54, 122, 255, 0.25);

  static const Color divider = Color.fromRGBO(
    228,
    233,
    243,
    1,
  );

  static const Color boxShadow = Color.fromRGBO(204, 221, 255, 0.35);

  static const Color boxRed = Color.fromRGBO(251, 55, 72, 0.12);

  static const Color boxBlack = Color.fromRGBO(54, 122, 255, 0.12);

  static const Color boxGreen = Color.fromRGBO(
    0,
    200,
    83,
    0.08,
  );

  static const Color boxBlue = Color.fromRGBO(
    152,
    187,
    255,
    0.55,
  );

  static const Color boxGrey = Color.fromRGBO(239, 242, 249, 1);

  static const Color greyLight = Color.fromRGBO(51, 51, 51, 1);

  // =========================
  // Status Colors
  // =========================

  static const Color success = Color.fromARGB(
    255,
    68,
    176,
    109,
  );

  static const Color warning = Colors.orange;

  static const Color error = Color.fromARGB(
    255,
    193,
    13,
    13,
  );

  static const Color lightRed = Color.fromARGB(
    255,
    245,
    72,
    81,
  );

  // =========================
  // Rating
  // =========================

  static const Color yellowRate = Colors.amber;

  // =========================
  // Case Status Colors
  // =========================

  static const Color statusWaitingApproval = Colors.orange;

  static const Color statusAccepted = Colors.blue;

  static const Color statusNeedInfo = Colors.deepPurple;

  static const Color statusInDesign = Colors.indigo;

  static const Color statusInProgress = Colors.cyan;

  static const Color statusReady = Colors.green;

  static const Color statusDelivered = Colors.teal;

  static const Color statusCancelled = Colors.red;

  // __________________________

  static const Color purple = Color.fromRGBO(
    170,
    130,
    255,
    1,
  );

  static const Color turquoise = Color.fromRGBO(
    0,
    180,
    140,
    1,
  );

  static const Color surfaceTintColor = Colors.transparent;

  // Community Status

  static const Color pendingPost = Color.fromRGBO(
    255,
    171,
    0,
    1,
  );

  static const Color pendingPostBackground = Color.fromRGBO(
    255,
    171,
    0,
    0.12,
  );

  static const Color approvedPostBackground = Color.fromRGBO(
    31,
    193,
    107,
    0.12,
  );

  static const Color rejectedPostBackground = Color.fromRGBO(
    251,
    55,
    72,
    0.12,
  );
}
