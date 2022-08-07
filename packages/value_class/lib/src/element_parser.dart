import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_annotation/value_annotation.dart';
import 'package:value_class/src/template_data.dart';
import 'package:value_class/src/templates/asserts.dart';

Never _throwSourceError(
  String message, {
  Element? element,
}) =>
    throw InvalidGenerationSourceError(message, element: element);

class ElementParser {
  ElementParser({
    required Element element,
  }) : _element = element;

  final Element _element;

  TemplateData parse() {
    final element = _element;
    final library = element.library!;

    if (!library.isNonNullableByDefault) {
      _throwSourceError(
        'Generator cannot target libraries that have not been migrated to '
        'null-safety.',
        element: element,
      );
    }

    final className = element.name ?? '';
    if (element is! ClassElement || element.isEnum || element.isMixin) {
      _throwSourceError(
        '''`@valueClass` can only be used on classes. Failing element: `$className`''',
        element: element,
      );
    }

    final isInitial = library.topLevelElements.first.displayName == className;

    if (element.isAbstract) {
      log.warning('The class `$className` need not be an abstract class.');
    }

    final content = element.source.contents.data;
    final containsMixins =
        content.contains(RegExp(r'with\s+_\$' + className + r'[,{\s]+'));
    if (!containsMixins) {
      _throwSourceError(
        'The class `$className` must mix-in `_\$$className`.',
        element: element,
      );
    }

    final mainConstructor =
        element.constructors.firstWhereOrNull((constructor) {
      final constructorName = constructor.displayName;
      return constructor.isFactory && constructorName == className;
    });
    if (mainConstructor == null) {
      _throwSourceError(
        '''The class `$className` must have `const factory $className(xxx value) = _$className`''',
        element: element,
      );
    }

    const assertTypeChecker = TypeChecker.fromRuntime(Assert);
    final asserts = assertTypeChecker.annotationsOf(mainConstructor).map((e) {
      final eval = e.getField('eval')!.toFunctionValue()!.displayName;
      final message = e.getField('message')?.toStringValue();
      return AssertTemplate(eval: eval, message: message);
    });

    if (asserts.isEmpty && !mainConstructor.isConst) {
      log.warning(
        'It is recommended that the constructor be given the const modifier.',
      );
    }

    if (asserts.isNotEmpty && mainConstructor.isConst) {
      _throwSourceError(
        '''When using `@Assert`, the constructor cannot be const modifier.''',
        element: mainConstructor,
      );
    }

    final parameters = mainConstructor.parameters;
    if (parameters.length != 1) {
      _throwSourceError(
        '''The class `$className` must have only one parameter in the constructor.''',
        element: parameters.lastOrNull ?? element,
      );
    }
    final parameter = parameters.first;
    final parameterName = parameter.name;
    if (parameterName != 'value') {
      _throwSourceError(
        'Parameter name must be `value`.',
        element: parameter,
      );
    }

    final parameterType = parameter.type;
    if (parameterType.nullabilitySuffix != NullabilitySuffix.none) {
      _throwSourceError(
        'Parameter must non-null.',
        element: parameter,
      );
    }
    final String typeName;
    if (parameterType.isDartCoreString) {
      typeName = 'String';
    } else if (parameterType.isDartCoreBool) {
      typeName = 'bool';
    } else if (parameterType.isDartCoreInt) {
      typeName = 'int';
    } else if (parameterType.isDartCoreDouble) {
      typeName = 'double';
    } else if (parameterType.isDartCoreNum) {
      typeName = 'num';
    } else {
      _throwSourceError(
        'Parameter type must be one of String, bool, int, double or num.',
        element: parameter,
      );
    }

    final containsClass = content.contains(
      RegExp(
        r'factory\s+' +
            className +
            r'\s*\(\s*' +
            typeName +
            r'\s+value[,\s]*\)\s*=\s*_' +
            className +
            r'\s*;',
      ),
    );
    if (!containsClass) {
      _throwSourceError(
        '''The class `$className` must have `factory $className($typeName value) = _$className`''',
        element: mainConstructor,
      );
    }

    return TemplateData(
      isInitial: isInitial,
      className: className,
      asserts: AssertsTemplate(asserts),
      isConst: mainConstructor.isConst,
      typeName: typeName,
    );
  }
}
