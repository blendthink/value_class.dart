import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class Data {
  final String className;
  final String valueName;
  final DartType valueType;

  Data({
    required this.className,
    required this.valueName,
    required this.valueType,
  });
}

class ElementParser {
  final Element _element;

  ElementParser(this._element);

  Never _throwSourceError(String message) =>
      throw InvalidGenerationSourceError(message, element: _element);

  Data? parse() {
    final element = this._element;
    final library = element.library!;

    if (!library.isNonNullableByDefault) {
      _throwSourceError(
        'Generator cannot target libraries that have not been migrated to '
        'null-safety.',
      );
    }

    final className = element.name ?? '';
    if (element is! ClassElement || element.isEnum || element.isMixin) {
      _throwSourceError(
        '`@valueClass` can only be used on classes. Failing element: `$className`',
      );
    }

    if (element.isAbstract) {
      log.warning('The class `$className` need not be an abstract class.');
    }

    final sourceFile = File(Directory.current.path.replaceFirst(
        'packages/value_class', 'packages/${element.source.fullName}'));
    final sourceContent = sourceFile.readAsStringSync();
    final containsMixins =
        sourceContent.contains(RegExp(r'with _\$' + className + ' {'));
    if (!containsMixins) {
      _throwSourceError(
        'The class `$className` must mix-in `_\$$className`.',
      );
    }
    return null;
  }
}
