// ignore_for_file: mixin_of_non_class, redirect_to_non_class

import 'package:source_gen_test/annotations.dart';
import 'package:value_annotation/value_annotation.dart';

@ShouldGenerate(
  r'''
Never _throwUnsupportedError() => throw UnsupportedError(
      'It seems like you constructed your class using private constructor.',
    );

/// @nodoc
mixin _$Example {
  String get value => _throwUnsupportedError();

  String toJson() => _throwUnsupportedError();
}

/// @nodoc
@immutable
class _Example implements Example {
  const _Example(this.value);

  @override
  final String value;

  @override
  String toJson() => value;

  @override
  String toString() => 'Example(value: $value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is _Example &&
          const DeepCollectionEquality().equals(other.value, value));

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));
}
''',
)
@valueClass
class Example with _$Example {
  const factory Example(String value) = _Example;

  const factory Example.fromJson(String value) = _Example;
}
