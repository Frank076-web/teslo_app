import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final bool isLoading;

  const CustomFilledButton({
    super.key,
    this.onPressed,
    this.buttonColor,
    this.isLoading = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(10);

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: radius,
            bottomRight: radius,
            topLeft: radius,
          ),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? const CircularProgressIndicator() : Text(text),
    );
  }
}
