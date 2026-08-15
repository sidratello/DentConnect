import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/utils/static.dart';

class LocationFilterChip extends StatelessWidget {
  final String selectedLocation;
  final List<String> locations;
  final ValueChanged<String> onSelected;

  const LocationFilterChip({
    super.key,
    required this.selectedLocation,
    required this.locations,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return PopupMenuButton<String>(
      onSelected: onSelected,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      itemBuilder: (_) => locations
          .map(
            (location) => PopupMenuItem(
              value: location,
              child: Text(
                location,
                style: TextStyle(
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontSize: Static.getwidth(context, 14),
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          )
          .toList(),
      child: Container(
        margin: EdgeInsets.only(
          left: Static.getwidth(context, 10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Static.getwidth(context, 16),
          vertical: Static.getheight(context, 10),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: primary,
              size: Static.getwidth(context, 18),
            ),
            SizedBox(
              width: Static.getwidth(context, 6),
            ),
            Text(
              selectedLocation,
              style: TextStyle(
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w600,
                fontSize: Static.getwidth(context, 13),
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(
              width: Static.getwidth(context, 4),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.onSurface,
              size: Static.getwidth(context, 18),
            ),
          ],
        ),
      ),
    );
  }
}
