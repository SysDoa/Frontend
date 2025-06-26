import 'package:sysdoa/src/app/presentation/modules/home/controllers/candidate_controller.dart';
import 'package:sysdoa/src/app/presentation/modules/home/controllers/menu_controller_index.dart';
import 'package:sysdoa/src/app/presentation/modules/home/widgets/candidates_widget.dart';
import 'package:sysdoa/src/app/presentation/modules/home/widgets/statistics_widget.dart';
import 'package:sysdoa/src/infra/icons/icon_infra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sysdoa/src/infra/images/logos/image_logo_infra.dart';
import 'package:sysdoa/src/infra/messages/message_dafult_infra.dart';
import 'package:uikit/uikit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final candidatoController = Injector.get<CandidateController>();
  final menuController = MenuControllerIndex();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            SizeToken.md - 3.5,
            SizeToken.sm,
            SizeToken.md,
            0,
          ),
          child: AppBar(
            title: Padding(
              padding: EdgeInsets.only(left: SizeToken.xs),
              child: SvgPicture.asset(
                ImageLogoInfra.logo,
                height: SizeToken.xxl,
              ),
            ),
            actions: [
              ValueListenableBuilder<bool>(
                valueListenable: candidatoController.isLoading,
                builder: (context, isLoading, child) {
                  return ButtonProgress(
                    text: MessageDafultInfra.donorsUpper,
                    icon: IconInfra.add,
                    isLoading: isLoading,
                    onPressed: () => candidatoController.registerCandidatos(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ContentDefault(
        child: ValueListenableBuilder(
          valueListenable: menuController.currentIndex,
          builder:
              (context, value, child) => IndexedStack(
                index: menuController.currentIndex.value,
                children: [StatisticsWidget(), CandidatesWidget()],
              ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: menuController.currentIndex,
        builder:
            (context, value, child) => ButtonNavigatorMenu(
              currentIndex: menuController.currentIndex.value,
              onTap: menuController.onIndexTapped,
              firstLabel: MessageDafultInfra.statistics,
              secoundLabel: MessageDafultInfra.candidatesUpper,
              firstIcon: IconInfra.chart,
              secoundIcon: IconInfra.list,
              footerLabel: MessageDafultInfra.developmentBy,
              footerLink: MessageDafultInfra.developerLink,
            ),
      ),
    );
  }
}
