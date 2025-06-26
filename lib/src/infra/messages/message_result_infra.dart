sealed class MessageResultInfra {
  static String apiError(String operation, String entity) =>
      "Houve um erro ao $operation os $entity! Tente novamente.";
  static String apiSuccess(String operation, String entity) =>
      "Os $entity foram $operation com sucesso.";
  static const String dataError = "Existem dados incorretos! Tente novamente.";
  static const String error = "Erro!";
  static const String success = "Sucesso!";
  static const String offlineServerError = "Estamos fora do ar!";
  static const String dataNotFound = "Dados não encontrados";
}
