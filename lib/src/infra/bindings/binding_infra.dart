import 'package:flutter_getit/flutter_getit.dart';
import 'package:sysdoa/src/app/data/repositories/candidate_repository_impl.dart';
import 'package:sysdoa/src/app/data/services/client/client_service.dart';
import 'package:sysdoa/src/app/data/services/client/client_service_impl.dart';
import 'package:sysdoa/src/app/data/services/messages/result_message_service.dart';
import 'package:sysdoa/src/app/data/services/messages/result_message_service_impl.dart';
import 'package:sysdoa/src/app/data/services/uploads/upload_service.dart';
import 'package:sysdoa/src/app/data/services/uploads/upload_service_impl.dart';
import 'package:sysdoa/src/app/domain/repositories/candidate_repository.dart';
import 'package:sysdoa/src/app/presentation/modules/home/controllers/candidate_controller.dart';
import 'package:sysdoa/src/app/presentation/viewmodels/candidato/candidate_view_model.dart';
import 'package:sysdoa/src/infra/navigators/navigator_global.dart';

class BindingInfra extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
    Bind.singleton<ClientService>((i) => ClientServiceImpl()),
    Bind.lazySingleton<UploadService>((i) => UploadServiceImpl()),
    Bind.singleton<CandidateRepository>(
      (i) => CandidateRepositoryImpl(clientService: i()),
    ),
    Bind.lazySingleton<ResultMessageService>(
      (i) =>
          ResultMessageServiceImpl(navigatorKey: NavigatorGlobal.navigatorKey),
    ),
    Bind.singleton(
      (i) => CandidateViewModel(
        candidatoRepository: i(),
        uploadService: i(),
        resultMessageService: i(),
      ),
    ),
    Bind.singleton((i) => CandidateController(candidatoViewModel: i())),
  ];
}
