// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ButtonNavigatorMenu extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final String firstLabel;
  final String secoundLabel;
  final String firstIcon;
  final String secoundIcon;
  final String footerLabel;
  final String footerLink;

  const ButtonNavigatorMenu({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.firstLabel,
    required this.secoundLabel,
    required this.firstIcon,
    required this.secoundIcon,
    required this.footerLabel,
    required this.footerLink,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeToken.xl4,
      child: Column(
        children: [
          BottomNavigationBar(
            elevation: 30,
            backgroundColor: ColorToken.info,
            fixedColor: ColorToken.light,
            onTap: onTap,
            currentIndex: currentIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedLabelStyle: Style.l4(
              color: ColorToken.light,
            ),
            items: [
              BottomNavigationBarItem(
                icon: currentIndex != 0
                    ? IconLargeLigth(icon: firstIcon)
                    : const SizedBox.shrink(),
                label: firstLabel,
              ),
              BottomNavigationBarItem(
                icon: currentIndex != 1
                    ? IconLargeLigth(icon: secoundIcon)
                    : const SizedBox.shrink(),
                label: secoundLabel,
              ),
            ],
          ),
          const DividerDefault(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: SizeToken.xxs),
            color: ColorToken.info,
            alignment: Alignment.center,
            width: double.infinity, 
            child: InkWell(
              onTap: () => launchUrlString(
                  footerLink),
              child: TextLabelL5Light(
                  text: footerLabel),
            ),
          )
        ],
      ),
    );
  }
}
