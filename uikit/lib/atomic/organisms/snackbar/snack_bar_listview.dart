// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SnackBarListview extends SnackBar {
  final String title;
  final String subtitle;
  final String iconLeading;
  final String iconTrailing;
  final Color? color;
  final BuildContext context;

  SnackBarListview({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconLeading,
    required this.iconTrailing,
    this.color,
    required this.context,
  }) : super(
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeToken.xs),
          ),
          dismissDirection: DismissDirection.up,
          duration: const Duration(seconds: 5),
          backgroundColor: ColorToken.light,
          margin: const EdgeInsets.only(
            bottom: SizeToken.xs,
            left: SizeToken.md,
            right: SizeToken.md,
          ),
          behavior: SnackBarBehavior.floating,
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: SizeToken.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeToken.xs),
              color: ColorToken.light,
              border: Border.all(color: ColorToken.neutral, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: ColorToken.semiDark,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 200,
                ),
              ],
            ),
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: TextLabelL1Dark(text: title),
              subtitle: TextBodyB2Dark(
                text: subtitle,
                overflow: true,
              ),
              leading: IconCircular(
                color: color,
                icon: iconLeading,
              ),
              trailing: IconButtonMediumDark(
                isBackgroundColor: false,
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                icon: iconTrailing,
              ),
            ),
          ),
        );
}
