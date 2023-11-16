import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import 'core_value_validators.dart';
import 'i_value_object.dart';
import 'value_failure.dart';

class UniqueId extends ValueObject<String> {
  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  const UniqueId._(this.value);

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(
      right(uniqueId),
    );
  }

  @override
  final Either<ValueFailure<String>, String> value;
}

class LastModifiedDate extends ValueObject<DateTime> {
  factory LastModifiedDate(DateTime input) {
    return LastModifiedDate._(
      validatePastTimestamp(input),
    );
  }

  const LastModifiedDate._(this.value);

  @override
  final Either<ValueFailure<DateTime>, DateTime> value;
}

class LastModifiedTimestamp extends ValueObject<DateTime> {
  factory LastModifiedTimestamp(DateTime input) {
    return LastModifiedTimestamp._(
      validatePastTimestamp(input),
    );
  }

  const LastModifiedTimestamp._(this.value);

  factory LastModifiedTimestamp.now() => LastModifiedTimestamp._(
        validatePastTimestamp(DateTime.now()),
      );

  @override
  final Either<ValueFailure<DateTime>, DateTime> value;
}
