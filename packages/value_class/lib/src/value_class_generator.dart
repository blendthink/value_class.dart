import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_annotation/value_annotation.dart';
import 'package:value_class/src/element_parser.dart';

class ValueClassGenerator extends GeneratorForAnnotation<ValueClass> {
  const ValueClassGenerator();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final content = await buildStep.readAsString(buildStep.inputId);
    final parser = ElementParser(element: element, content: content);
    final data = parser.parse();
    return data.toString();
  }
}
