import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_annotation/value_annotation.dart';
import 'package:value_class/src/element_parser.dart';

class ValueClassGenerator extends GeneratorForAnnotation<ValueClass> {
  const ValueClassGenerator();

  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final parser = ElementParser(element);
    final data = parser.parse();
    if (data == null) {
      return null;
    }

    return 'const demo = 1;';
  }
}
