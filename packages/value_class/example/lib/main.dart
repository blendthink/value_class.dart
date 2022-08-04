import 'dart:convert';

import 'package:example/model/email.dart';
import 'package:example/model/person.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  const personBefore = Person(email: Email('example@gmail.com'));
  final encoded = jsonEncode(personBefore);

  final decoded = jsonDecode(encoded) as Map<String, dynamic>;
  final personAfter = Person.fromJson(decoded);

  SimpleLogger()
    ..info('Encoded: $encoded')
    ..info('Decoded: $personAfter')
    ..info('Equals: ${personBefore == personAfter}');
}
