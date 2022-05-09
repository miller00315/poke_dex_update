/// Altera  iuma string com base em um mapa de variáveis
/// [text] é a string a ser alterada, [variables] são as váriaveis a serem inseridas dentro no lugar de {{key_variavel}}
String replaceVariables(
    {required String text, required Map<String, String> variables}) {
  assert(variables.isNotEmpty);

  variables.forEach((key, value) {
    text = text.replaceAll('{{$key}}', value);
  });

  return text;
}
