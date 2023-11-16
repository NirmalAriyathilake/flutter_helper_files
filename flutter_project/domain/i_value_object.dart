import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'errors.dart';
import 'value_failure.dart';

/// Value Object Interface
@immutable
abstract class ValueObject<T> {
  /// Default constructor
  const ValueObject();

  /// Value of value object
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrElse(T Function() orElse) {
    return value.fold((_) => orElse(), id);
  }

  /// Get Value failure
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      left,
      (r) => right(unit),
    );
  }

  /// If value of either is right
  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$T(value: $value)';
}
