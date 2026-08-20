import 'package:flutter/material.dart';

import 'package:template/core/app_colors.dart';

class BlogAddPostButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BlogAddPostButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: Colors.white,
      elevation: 6,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add_rounded,
        size: 32,
      ),
    );
  }
}