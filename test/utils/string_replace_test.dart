import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_dex/utils/string_replace.dart';

void main() {
  final faker = Faker();

  final num = faker.person.name();

  const testUrl = 'https://test.com/{{value}}';

  group('StringReplace group', () {
    test('should replace value with the parameter', () {
      final match = testUrl.replaceAll('{{value}}', num);

      final replaceTest = replaceVariables(
        text: testUrl,
        variables: {'value': num},
      );

      expect(replaceTest, match);
    });
  });

  test('should thrown a error when map is empty', () {
    expect(
      () => replaceVariables(
        text: testUrl,
        variables: {},
      ),
      throwsAssertionError,
    );
  });
}
