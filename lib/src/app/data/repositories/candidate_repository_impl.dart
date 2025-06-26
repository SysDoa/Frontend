// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:sysdoa/src/infra/apis/api_infra.dart';
import 'package:sysdoa/src/infra/exceptions/exception_infra.dart';
import 'package:sysdoa/src/app/domain/dtos/candidate_register_dto.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import 'package:sysdoa/src/app/data/services/client/client_service.dart';
import 'package:sysdoa/src/infra/messages/message_dafult_infra.dart';
import 'package:sysdoa/src/infra/messages/message_result_infra.dart';

import '../../domain/repositories/candidate_repository.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  final ClientService clientService;
  CandidateRepositoryImpl({
    required this.clientService,
  });

  @override
  AsyncResult<List<CandidateRegisterDto>> registerCandidates(
      File arquivo) async {
    try {
      String fileContent = await arquivo.readAsString();

      List<dynamic> jsonList = json.decode(fileContent);

      List<CandidateRegisterDto> list = jsonList
          .map((json) =>
              CandidateRegisterDto.fromMap(json as Map<String, dynamic>))
          .toList();

      await clientService.post(ApiConstant.candidatesRegister,
          list.map((candidate) => candidate.toMap()).toList());

      return Success(list);
    } on DioException catch (e) {
      return Failure(
        ExceptionInfra(
            message: MessageResultInfra.apiError(MessageDafultInfra.register, MessageDafultInfra.candidatesLower),
            statusCode: e.response?.statusCode ?? 500),
      );
    } catch(e){
       return Failure(
        ExceptionInfra(
            message: MessageResultInfra.dataError,
            statusCode: 501),
      );
    }
  }

}
