class TemplateData {
  final bool _isInitial;
  final String _className;
  final String _typeName;

  TemplateData({
    required bool isInitial,
    required String className,
    required String typeName,
  })  : _isInitial = isInitial,
        _className = className,
        _typeName = typeName;

  String get _common => !_isInitial
      ? ''
      : '''
Never _throwUnsupportedError() => throw UnsupportedError(
    'It seems like you constructed your class using private constructor.');
''';

  @override
  String toString() => '''
$_common
/// @nodoc
mixin _\$$_className {
  $_typeName get value => _throwUnsupportedError();

  $_typeName toJson() => _throwUnsupportedError();
}

/// @nodoc
class _$_className implements $_className {
  final $_typeName value;

  const _$_className(this.value);

  $_typeName toJson() => value;

  @override
  String toString() => '$_className(value: \$value)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_className &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));
}
''';
}
