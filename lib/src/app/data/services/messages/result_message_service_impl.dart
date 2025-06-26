// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sysdoa/src/infra/icons/icon_infra.dart';
import 'package:sysdoa/src/infra/messages/message_result_infra.dart';

import 'package:uikit/uikit.dart';

import 'result_message_service.dart';

class ResultMessageServiceImpl implements ResultMessageService {
  final GlobalKey<NavigatorState> navigatorKey;
  ResultMessageServiceImpl({required this.navigatorKey});

  @override
  showMessageError(String message) {
    if (navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBarListview(
          title: MessageResultInfra.error,
          subtitle: message,
          iconLeading: IconInfra.error,
          iconTrailing: IconInfra.close,
          context: navigatorKey.currentContext!,
          color: ColorToken.info,
        ),
      );
    }
  }

  @override
  showMessageSuccess(String message, String iconLeading) {
    if (navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBarListview(
          title: MessageResultInfra.success,
          subtitle: message,
          iconLeading: iconLeading,
          iconTrailing: IconInfra.close,
          context: navigatorKey.currentContext!,
          color: ColorToken.info,
        ),
      );
    }
  }
}
