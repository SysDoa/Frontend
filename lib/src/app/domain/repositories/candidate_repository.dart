import 'dart:io';

import 'package:sysdoa/src/app/domain/dtos/candidate_register_dto.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class CandidateRepository {
  AsyncResult<List<CandidateRegisterDto>> registerCandidates(File arquivo);
}
