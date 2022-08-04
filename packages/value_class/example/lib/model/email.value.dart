// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: lines_longer_than_80_chars, deprecated_member_use, deprecated_member_use_from_same_package

part of 'email.dart';

// **************************************************************************
// ValueClassGenerator
// **************************************************************************

Never _throwUnsupportedError() => throw UnsupportedError(
      'It seems like you constructed your class using private constructor.',
    );

/// @nodoc
mixin _$Email {
  String get value => _throwUnsupportedError();

  String toJson() => _throwUnsupportedError();
}

/// @nodoc
@immutable
class _Email implements Email {
  const _Email(this.value);

  @override
  final String value;

  @override
  String toJson() => value;

  @override
  String toString() => 'Email(value: $value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is _Email &&
          const DeepCollectionEquality().equals(other.value, value));

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));
}
