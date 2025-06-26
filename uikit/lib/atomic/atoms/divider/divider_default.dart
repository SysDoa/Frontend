import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class DividerDefault extends StatelessWidget {
  const DividerDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      endIndent: 0,
      height: 0,
      color: ColorToken.light,
      thickness: 0.2,
    );
  }
}
