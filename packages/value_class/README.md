[![Pub Version](https://badgen.net/pub/v/value_class)](https://pub.dev/packages/value_class/)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/value_class)](https://pub.dev/packages/value_class/)
[![Pub popularity](https://badgen.net/pub/popularity/value_class)](https://pub.dev/packages/value_class/score)

## Features

By annotating the class, the code required for the "Value Class" is automatically generated.

Inspired by [json_serializable] and [freezed].

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

## Supported types

The following Types in the [dart:core] library are supported:

- [`String`]
- [`bool`]
- [`int`]
- [`double`]
- [`num`]

More types will be supported in the future.

### Under consideration

- [`BigInt`]
- [`Enum`]
- [`Iterable`]
- [`List`]
- [`Map`]
- [`Set`]
- [`Uri`]
- [`DateTime`]
- [`Duration`]
- [`Object`] that has `fromJson()` and `toJson()`

<!-- Links -->
[json_serializable]: https://pub.dev/packages/json_serializable
[freezed]: https://pub.dev/packages/freezed
[dart:core]: https://api.dart.dev/stable/dart-core/dart-core-library.html
[`String`]: https://api.dart.dev/stable/dart-core/String-class.html
[`bool`]: https://api.dart.dev/stable/dart-core/bool-class.html
[`int`]: https://api.dart.dev/stable/dart-core/int-class.html
[`double`]: https://api.dart.dev/stable/dart-core/double-class.html
[`num`]: https://api.dart.dev/stable/dart-core/num-class.html
[`BigInt`]: https://api.dart.dev/stable/dart-core/BigInt-class.html
[`Enum`]: https://api.dart.dev/stable/dart-core/Enum-class.html
[`Iterable`]: https://api.dart.dev/stable/dart-core/Iterable-class.html
[`List`]: https://api.dart.dev/stable/dart-core/List-class.html
[`Map`]: https://api.dart.dev/stable/dart-core/Map-class.html
[`Set`]: https://api.dart.dev/stable/dart-core/Set-class.html
[`Uri`]: https://api.dart.dev/stable/dart-core/Uri-class.html
[`DateTime`]: https://api.dart.dev/stable/dart-core/DateTime-class.html
[`Duration`]: https://api.dart.dev/stable/dart-core/Duration-class.html
[`Object`]: https://api.dart.dev/stable/dart-core/Object-class.html
