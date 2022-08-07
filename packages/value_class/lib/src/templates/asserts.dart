class AssertsTemplate {
  AssertsTemplate(this.asserts);

  final Iterable<AssertTemplate> asserts;

  @override
  String toString() {
    if (asserts.isEmpty) {
      return '';
    }

    return ' : ${asserts.join(', ')}';
  }
}

class AssertTemplate {
  AssertTemplate({
    required this.eval,
    this.message,
  });

  final String eval;
  final String? message;

  @override
  String toString() {
    if (message != null) {
      return "assert($eval(value), '$message')";
    }
    return 'assert($eval(value))';
  }
}
