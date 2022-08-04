import 'package:example/model/email.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required Email email,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
