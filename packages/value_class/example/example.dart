import 'package:value_annotation/value_annotation.dart';

part 'example.value.dart';

@valueClass
class Example with _$Example {
  const factory Example(String value) = _Example;

  const factory Example.fromJson(String value) = _Example;
}