import 'package:flutter_getit/flutter_getit.dart';
import 'package:sysdoa/src/app/presentation/modules/home/pages/home_page.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get moduleRouteName => '/';

  @override
  List<FlutterGetItPageRouter> get pages => [
    FlutterGetItPageRouter(
      name: '/',
      builder: (context) => HomePage(),
    ),
  ];
}
