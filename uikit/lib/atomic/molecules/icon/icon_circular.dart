// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconCircular extends StatelessWidget {
  final String icon;
  final double? padding;
  final Color? color;
  const IconCircular({
    super.key,
    required this.icon,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeToken.xl3,
      width: SizeToken.xl3,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeToken.xl3),
        color: color ?? ColorToken.info,
      ),
      child: IconDefault(icon: icon, height: 19, colorIcon: ColorToken.light),
    );
  }
}
