Map<String, String> createMapFromString(String input) {
  List<String> keyValuePairs = input.replaceAll(RegExp(':'), '').split(' ');
  Map<String, String> result = {};
  print(keyValuePairs.length);
  for (int i = 0; i < keyValuePairs.length; i += 2) {
    final key = keyValuePairs[i];
    final value = keyValuePairs[i + 1];
    result[key] = value;
  }

  return result;
}