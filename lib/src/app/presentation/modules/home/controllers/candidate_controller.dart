// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:sysdoa/src/app/presentation/viewmodels/candidato/candidate_view_model.dart';

class CandidateController extends ChangeNotifier {
  final CandidateViewModel candidatoViewModel;
  CandidateController({required this.candidatoViewModel});

  ValueNotifier<bool> get isLoading => candidatoViewModel.isLoading;
  ValueNotifier<bool> get isError => candidatoViewModel.isError;

  registerCandidatos() async {
    await candidatoViewModel.postAll();
  }
}
