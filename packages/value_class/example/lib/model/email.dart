import 'package:value_annotation/value_annotation.dart';

part 'email.value.dart';

@valueClass
class Email with _$Email {
  @Assert(_checkNotEmpty, 'Email cannot be empty')
  @Assert(_checkFormat, 'Email format is invalid')
  factory Email(String value) = _Email;

  factory Email.fromJson(String value) = _Email;
}

bool _checkNotEmpty(String value) => value.isNotEmpty;
bool _checkFormat(String value) => value.contains(RegExp(r'^.+@\S+\.\S+$'));
