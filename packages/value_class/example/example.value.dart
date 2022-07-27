// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

part of 'example.dart';

// **************************************************************************
// ValueClassGenerator
// **************************************************************************

Never _throwUnsupportedError() => throw UnsupportedError(
    'It seems like you constructed your class using private constructor.');

/// @nodoc
mixin _$Example {
  String get value => _throwUnsupportedError();

  String toJson() => _throwUnsupportedError();
}

/// @nodoc
class _Example implements Example {
  final String value;

  const _Example(this.value);

  String toJson() => value;

  @override
  String toString() => 'Example(value: $value)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Example &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));
}
