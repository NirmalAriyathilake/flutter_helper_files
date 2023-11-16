import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'core_value_failure.dart';
import 'value_failure.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.core(CoreValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    )));
  }
}

Either<ValueFailure<String>, String> validateStringLength(
  String input,
  int length,
) {
  if (input.length == length) {
    return right(input);
  } else {
    return left(ValueFailure.core(CoreValueFailure.invalidLength(
      failedValue: input,
      length: length,
    )));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.core(CoreValueFailure.empty(failedValue: input)));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (!input.contains('\n')) {
    return right(input);
  } else {
    return left(
        ValueFailure.core(CoreValueFailure.multiLine(failedValue: input)));
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.core(
        CoreValueFailure.listTooLong(
          failedValue: input,
          max: maxLength,
        ),
      ),
    );
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMinListLength<T>(
  KtList<T> input,
  int minLength,
) {
  if (input.size >= minLength) {
    return right(input);
  } else {
    return left(ValueFailure.core(CoreValueFailure.listTooShort(
      failedValue: input,
      min: minLength,
    )));
  }
}

Either<ValueFailure<String>, String> validateIfContains(
  String input,
  List options,
) {
  if (options.contains(input)) {
    return right(input);
  } else {
    return left(ValueFailure.core(CoreValueFailure.optionNotValid(
      failedValue: input,
    )));
  }
}

Either<ValueFailure<int>, int> validateIntIfPositive(int input) {
  if (input >= 0) {
    return right(input);
  } else {
    return left(ValueFailure.core(CoreValueFailure.valueNotPositive(
      failedValue: input,
    )));
  }
}

Either<ValueFailure<double>, double> validateDoubleIfPositive(double input) {
  if (input >= 0) {
    return right(input);
  } else {
    return left(ValueFailure.core(CoreValueFailure.valueNotPositive(
      failedValue: input,
    )));
  }
}

Either<ValueFailure<DateTime>, DateTime> validatePastTimestamp(DateTime input) {
  if (input.isAfter(DateTime.now())) {
    return left(ValueFailure.core(CoreValueFailure.futureTimestamp(
      failedValue: input,
    )));
  } else {
    return right(input);
  }
}
