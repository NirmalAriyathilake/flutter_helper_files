import 'value_failure.dart';

/// Unexpected Error
class UnexpectedValueError extends Error {
  /// Default Contructor
  UnexpectedValueError(this.valueFailure);

  /// Value failure of error
  final ValueFailure valueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
