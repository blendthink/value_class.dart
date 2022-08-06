/// A decorator that allows adding `assert(...)` on the generated classes.
///
/// Usage example:
///
/// ```dart
/// @valueClass
/// class Email with _$Email {
///   @Assert(_checkNotEmpty, 'Email cannot be empty')
///   @Assert(_checkFormat, 'Email format is invalid')
///   factory Email(String value) = _Email;
///
///   factory Email.fromJson(String value) = _Email;
/// }
///
/// bool _checkNotEmpty(String value) => value.isNotEmpty;
/// bool _checkFormat(String value) => value.contains(RegExp(r'^.+@\S+\.\S+$'));
/// ```
///
/// TODO: @Target({TargetKind.constructor})
/// see: https://github.com/dart-lang/sdk/issues/47421
class Assert<T> {
  const Assert(this.eval, [this.message]);

  final bool Function(T) eval;
  final String? message;
}
