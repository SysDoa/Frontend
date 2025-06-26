// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_svg/svg.dart';
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class ButtonProgress extends StatelessWidget {
  final String text;
  final String? icon;
  final bool isLoading;
  final void Function()? onPressed;
  const ButtonProgress({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
      isBorderRadio: true,
      backgroundColor: ColorToken.info,
      onPressed: isLoading ? null : onPressed,
      icon: icon != null
          ? SvgPicture.asset(
              icon!,
              colorFilter:
                  const ColorFilter.mode(ColorToken.light, BlendMode.srcIn),
              height: SizeToken.xs,
            )
          : const SizedBox.shrink(),
      child: isLoading
          ? const Center(
              child: SizedBox(
                height: SizeToken.sm,
                width: SizeToken.sm,
                child: CircularProgressIndicator(
                  color: ColorToken.light,
                  strokeWidth: 2,
                ),
              ),
            )
          : TextLabelL4Light(
              text: text,
            ),
    );
  }
}
