import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sysdoa/src/app/presentation/modules/home/controllers/candidate_controller.dart';
import 'package:sysdoa/src/infra/images/errors/image_error_infra.dart';
import 'package:sysdoa/src/infra/messages/message_result_infra.dart';
import 'package:uikit/uikit.dart';

class StatisticsWidget extends StatelessWidget {
  StatisticsWidget({super.key});
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

        return const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
   BannerError(
              image: ImageErrorInfra.server,
              text: MessageResultInfra.offlineServerError,
            ),
              SizedBox(height: SizeToken.xl3),
            ],
          ),
        );
      },
    );
  }
}
