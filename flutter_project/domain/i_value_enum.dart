import 'package:dartz/dartz.dart';

import 'core_value_failure.dart';
import 'errors.dart';
import 'value_failure.dart';

abstract class ValueEnum<T> {
  const ValueEnum(this._value);

  final T _value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ValueEnum<T> && other.value == _value;
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => '$_value';

  T get value => _value;

  List<T> get values => [];

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    if (!values.contains(_value)) {
      throw UnexpectedValueError(ValueFailure.core(
          CoreValueFailure.optionNotValid(failedValue: _value)));
    } else {
      return _value;
    }
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    if (values.contains(_value)) {
      return right(unit);
    } else {
      return left(ValueFailure.core(
          CoreValueFailure.optionNotValid(failedValue: _value)));
    }
  }
}
