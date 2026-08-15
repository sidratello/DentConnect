import 'package:flutter/material.dart';

class PasswordVisibilityIcon extends StatelessWidget {
  final bool visible;
  final VoidCallback onPressed;

  const PasswordVisibilityIcon({
    super.key,
    required this.visible,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        visible ? Icons.visibility : Icons.visibility_off_rounded,
        color: const Color.fromARGB(255, 13, 12, 12),
      ),
      onPressed: onPressed,
    );
  }
}
