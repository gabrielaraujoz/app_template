class AppException {
  final dynamic exception;
  final bool isFatal;

  const AppException({
    this.exception,
    required this.isFatal,
  });

  @override
  String toString() {
    return 'Exception: $exception, fatal: $isFatal';
  }
}
