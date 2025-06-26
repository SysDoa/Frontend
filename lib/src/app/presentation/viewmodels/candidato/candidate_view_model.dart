// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sysdoa/src/infra/exceptions/exception_infra.dart';
import 'package:sysdoa/src/app/data/services/messages/result_message_service.dart';
import 'package:sysdoa/src/app/data/services/uploads/upload_service.dart';
import 'package:sysdoa/src/app/domain/repositories/candidate_repository.dart';

import 'package:sysdoa/src/infra/icons/icon_infra.dart';
import 'package:sysdoa/src/infra/messages/message_dafult_infra.dart';
import 'package:sysdoa/src/infra/messages/message_result_infra.dart';

class CandidateViewModel extends ChangeNotifier {
  final CandidateRepository candidatoRepository;
  final UploadService uploadService;
  final ResultMessageService resultMessageService;
  CandidateViewModel({
    required this.candidatoRepository,
    required this.uploadService,
    required this.resultMessageService,
  });

  final isLoading = ValueNotifier<bool>(false);
  final isError = ValueNotifier<bool>(false);

  postAll() async {
    isLoading.value = true;
    final file = await uploadService.getFileJson();
    if (file != null) {
      final result = await candidatoRepository.registerCandidates(file);
      result.fold(
        (success) => resultMessageService.showMessageSuccess(
          MessageResultInfra.apiSuccess(
            MessageDafultInfra.registered,
            MessageDafultInfra.candidatesLower,
          ),
          IconInfra.success,
        ),
        (failure) {
          if (failure is ExceptionInfra) {
            resultMessageService.showMessageError(failure.message);
          }
        },
      );
    }
    isLoading.value = false;
  }
}
