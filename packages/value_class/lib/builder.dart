import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:value_class/src/value_class_generator.dart';

Builder builder(BuilderOptions options) {
  // final config = ValueClass.fromJson(options.config)
  // ValueClassGenerator(config)
  return PartBuilder(
    [const ValueClassGenerator()],
    '.value.dart',
    header: '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
    ''',
    options: options,
  );
}
