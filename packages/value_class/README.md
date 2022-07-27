[![Pub Version](https://badgen.net/pub/v/value_class)](https://pub.dev/packages/value_class/)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/value_class)](https://pub.dev/packages/value_class/)
[![Pub popularity](https://badgen.net/pub/popularity/value_class)](https://pub.dev/packages/value_class/score)

## Features

By annotating the class, the code required for the "Value Class" is automatically generated.

Inspired by [json_serializable](https://pub.dev/packages/json_serializable)
and [freezed](https://pub.dev/packages/freezed).

## Getting started

Flutter project:

```shell
flutter pub add value_annotation
flutter pub add --dev build_runner
flutter pub add --dev value_class

flutter pub get
```

Dart project:

```shell
dart pub add value_annotation
dart pub add --dev build_runner
dart pub add --dev value_class

dart pub get
```

## Usage

### 1. Create class

```dart
import 'package:value_annotation/value_annotation.dart';

part 'example.value.dart';

@valueClass
class Example with _$Example {
  const factory Example(String value) = _Example;

  const factory Example.fromJson(String value) = _Example;
}
```

### 2. Run generator

Flutter project:

```shell
flutter pub run build_runner build
```

Dart project:

```shell
dart run build_runner build
```
