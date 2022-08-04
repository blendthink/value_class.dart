import 'package:value_annotation/value_annotation.dart';

part 'email.value.dart';

@valueClass
class Email with _$Email {
  const factory Email(String value) = _Email;

  const factory Email.fromJson(String value) = _Email;
}
