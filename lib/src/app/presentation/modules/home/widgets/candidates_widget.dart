import 'package:sysdoa/src/app/presentation/modules/home/controllers/candidate_controller.dart';
import 'package:sysdoa/src/infra/icons/icon_infra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sysdoa/src/infra/images/errors/image_error_infra.dart';
import 'package:sysdoa/src/infra/messages/message_dafult_infra.dart';
import 'package:sysdoa/src/infra/messages/message_result_infra.dart';
import 'package:uikit/uikit.dart';

class CandidatesWidget extends StatelessWidget {
  CandidatesWidget({super.key});

  final controller = Injector.get<CandidateController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.isError,
      builder: (context, value, child) {
        if (value) {
          return const Center(
            child: BannerError(
              image: ImageErrorInfra.server,
              text: MessageResultInfra.offlineServerError,
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SizeToken.xl),
              const Align(
                alignment: Alignment.center,
                child: TextHeadlineH2(
                  text: MessageDafultInfra.suitableCandidates,
                ),
              ),
              const SizedBox(height: SizeToken.lg),
              InputSearch(
                onChanged: (_) {},
                hintText: MessageDafultInfra.research,
                icon: IconInfra.search,
              ),
              const SizedBox(height: SizeToken.xxs),
              Align(
                alignment: Alignment.centerRight,
                child: TextBodyB2SemiDark(
                  text: MessageDafultInfra.calculateFound("0"),
                ),
              ),
              const SizedBox(height: SizeToken.sm),
              Center(
                child: TextBodyB1SemiDark(
                  text: MessageResultInfra.dataNotFound,
                ),
              ),
              const SizedBox(height: SizeToken.xl3),
            ],
          ),
        );
      },
    );
  }
}
