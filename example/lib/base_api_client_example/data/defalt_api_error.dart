class DefaultApiError {
  final String? message;

  DefaultApiError({
    this.message,
  });

  factory DefaultApiError.empty() => DefaultApiError(
        message: '',
      );
}
