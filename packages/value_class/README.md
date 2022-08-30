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

## Asserts

Similar to [freezed], you can use `@Assert` to add `assert(...) ` statement to the generated class.

> **Note**\
> Unlike [freezed], the first argument of `@Assert` is a `Function` instead of a `String` to reduce typos.
> Therefore, the constructor cannot be given the const modifier.

```dart
import 'package:value_annotation/value_annotation.dart';

part 'email.value.dart';

@valueClass
class Email with _$Email {
  @Assert(_checkNotEmpty, 'Email cannot be empty')
  @Assert(_checkFormat, 'Email format is invalid')
  factory Email(String value) = _Email;
}

bool _checkNotEmpty(String value) => value.isNotEmpty;
bool _checkFormat(String value) => value.contains(RegExp(r'^.+@\S+\.\S+$'));
```

## Combination

This package supports the combination of [json_serializable] and [freezed].

See the [example] directory.

```dart:example/lib/model/email.dart
import 'package:value_annotation/value_annotation.dart';

part 'email.value.dart';

@valueClass
class Email with _$Email {
  @Assert(_checkNotEmpty, 'Email cannot be empty')
  @Assert(_checkFormat, 'Email format is invalid')
  factory Email(String value) = _Email;

  factory Email.fromJson(String value) = _Email;
}

bool _checkNotEmpty(String value) => value.isNotEmpty;
bool _checkFormat(String value) => value.contains(RegExp(r'^.+@\S+\.\S+$'));
```

```dart:example/lib/model/person.dart
import 'package:example/model/email.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required Email email,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
```

```dart:example/lib/main.dart
import 'dart:convert';

import 'package:example/model/email.dart';
import 'package:example/model/person.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  final personBefore = Person(email: Email('example@gmail.com'));
  final encoded = jsonEncode(personBefore);

  final decoded = jsonDecode(encoded) as Map<String, dynamic>;
  final personAfter = Person.fromJson(decoded);

  SimpleLogger()
    ..info('Encoded: $encoded')
    ..info('Decoded: $personAfter')
    ..info('Equals: ${personBefore == personAfter}');
}
```

Executing `main()` will output following log.

```shell
👻 INFO 2022-08-05 01:20:40.412135 [caller info not available] Encoded: {"email":"example@gmail.com"}
👻 INFO 2022-08-05 01:20:40.414220 [caller info not available] Decoded: Person(email: Email(value: example@gmail.com))
👻 INFO 2022-08-05 01:20:40.414812 [caller info not available] Equals: true

Process finished with exit code 0
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

## How to contribute

You should follow our [Code of Conduct].

See [Contributor Guide] for contributing conventions.

### Contributors

<table>
<tr>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/blendthink>
            <img src=https://avatars.githubusercontent.com/u/32213113?v=4 width="100;"  alt=blendthink/>
            <br />
            <sub style="font-size:14px"><b>blendthink</b></sub>
        </a>
    </td>
</tr>
</table>

<!-- Links -->

[json_serializable]: https://pub.dev/packages/json_serializable
[freezed]: https://pub.dev/packages/freezed
[example]: ./example
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
[Code of Conduct]: ./../../docs/CODE_OF_CONDUCT.md
[Contributor Guide]: ../../docs/contributing/CONTRIBUTING.md
