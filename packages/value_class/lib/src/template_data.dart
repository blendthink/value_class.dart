import 'package:value_class/src/templates/asserts.dart';

class TemplateData {
  TemplateData({
    required bool isInitial,
    required String className,
    required AssertsTemplate asserts,
    required bool isConst,
    required String typeName,
  })  : _isInitial = isInitial,
        _className = className,
        _asserts = asserts,
        _isConst = isConst,
        _typeName = typeName;

  final bool _isInitial;
  final String _className;
  final AssertsTemplate _asserts;
  final bool _isConst;
  final String _typeName;

  String get _common => !_isInitial
      ? ''
      : '''
Never _throwUnsupportedError() => throw UnsupportedError(
      'It seems like you constructed your class using private constructor.',
    );
''';

  String get _const => !_isConst ? '' : 'const';

  @override
  String toString() => '''
$_common
/// @nodoc
mixin _\$$_className {
  $_typeName get value => _throwUnsupportedError();

  $_typeName toJson() => _throwUnsupportedError();
}

/// @nodoc
@immutable
class _$_className implements $_className {
  $_const _$_className(this.value)$_asserts;

  @override
  final $_typeName value;

  @override
  $_typeName toJson() => value;

  @override
  String toString() => '$_className(value: \$value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is _$_className &&
          const DeepCollectionEquality().equals(other.value, value));

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));
}
''';
}
