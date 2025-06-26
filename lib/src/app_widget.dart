import 'package:sysdoa/src/app/presentation/modules/home/home_module.dart';
import 'package:sysdoa/src/infra/bindings/binding_infra.dart';
import 'package:sysdoa/src/infra/messages/message_dafult_infra.dart';
import 'package:sysdoa/src/infra/navigators/navigator_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:uikit/uikit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: BindingInfra(),
      modules: [HomeModule()],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          title: MessageDafultInfra.systemName,
          debugShowCheckedModeBanner: false,
          theme: theme,
          navigatorKey: NavigatorGlobal.navigatorKey,
          routes: routes,
        );
      },
    );
  }
}
