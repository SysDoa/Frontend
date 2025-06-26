// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonDefault extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final bool isBorderRadio;
    final Widget? icon;
  const ButtonDefault({
    super.key,
    this.onPressed,
    required this.child,
    required this.backgroundColor,
    this.padding,
    this.isBorderRadio = true, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: child,
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: isBorderRadio
                ? BorderRadius.circular(SizeToken.lg)
                : BorderRadius.circular(0),
          ),
        ),
        elevation: const WidgetStatePropertyAll<double>(0),
        padding: WidgetStatePropertyAll(padding),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      icon: icon?? icon,
    );
  }
}
