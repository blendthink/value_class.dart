## 1.1.0

### Added

- Supported `@Assert` to generate `assert(...)` statements on the generated classes:

    ```dart
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

## 1.0.2

### Fixed

- Supported the combination of [json_serializable] and [freezed].

## 1.0.1

### Fixed

- Changed how content is accessed.

## 1.0.0+1

### Fixed

- Create `.pubignore`.

## 1.0.0

- Initial version.

<!-- Links -->

[json_serializable]: https://pub.dev/packages/json_serializable
[freezed]: https://pub.dev/packages/freezed
