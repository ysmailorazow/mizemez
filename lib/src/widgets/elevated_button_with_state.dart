import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/constants/app_colors.dart';

class ElevatedButtonWithState extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final Widget child;
  final VoidCallback onPressed;
  const ElevatedButtonWithState(
      {Key? key,
      required this.isLoading,
      required this.isError,
      required this.child,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              isError ? Theme.of(context).colorScheme.error : null),
      child: _getState(),
    );
  }

  Widget _getState() {
    if (isLoading) {
      return const CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
      );
    }
    if (isError) {
      return Text('error'.tr);
    }
    return child;
  }
}
