import 'package:flutter/material.dart';

class ObscureIcon extends StatelessWidget {
  final bool isObscure;
  final VoidCallback onPressed;
  const ObscureIcon(
      {super.key, required this.isObscure, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.visibility_off_rounded),
      isSelected: isObscure,
      selectedIcon: const Icon(Icons.visibility_rounded),
    );
  }
}
