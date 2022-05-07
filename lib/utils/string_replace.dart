/// Replace values inside a string that like {{value}}
/// [text] is the string that will be replaced, [variables] is the values that will be set
String replaceVariables(
    {required String text, required Map<String, String> variables}) {
  assert(variables.isNotEmpty);

  variables.forEach((key, value) {
    text = text.replaceAll('{{$key}}', value);
  });

  return text;
}
