import 'dart:io';

import 'package:dartx/dartx_io.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:value_annotation/value_annotation.dart';
import 'package:value_class/src/value_class_generator.dart';

Future<void> main() async {
  initializeBuildLogTracking();
  for (final file in Directory('test/successes').listSync(recursive: true)) {
    if (file is! File || !file.path.endsWith('.dart')) {
      continue;
    }
    final reader = await initializeLibraryReaderForDirectory(
      file.dirName,
      file.name,
    );
    testAnnotatedElements<ValueClass>(
      reader,
      const ValueClassGenerator(),
    );
  }
}
