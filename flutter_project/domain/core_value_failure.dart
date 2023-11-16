import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_value_failure.freezed.dart';

@freezed
class CoreValueFailure<T> with _$CoreValueFailure<T> {
  const factory CoreValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory CoreValueFailure.emptyObject({
    required T failedValue,
  }) = EmptyObject<T>;

  const factory CoreValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory CoreValueFailure.futureTimestamp({
    required T failedValue,
  }) = FutureTimestamp<T>;

  const factory CoreValueFailure.invalidLength({
    required T failedValue,
    required int length,
  }) = InvalidLength<T>;

  const factory CoreValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;

  const factory CoreValueFailure.listTooShort({
    required T failedValue,
    required int min,
  }) = ListTooShort<T>;

  const factory CoreValueFailure.mismatchDataType({
    required T failedValue,
  }) = MismatchDataType<T>;

  const factory CoreValueFailure.multiLine({
    required T failedValue,
  }) = MultiLine<T>;

  const factory CoreValueFailure.optionNotValid({
    required T failedValue,
  }) = OptionNotValid<T>;

  const factory CoreValueFailure.valueNotPositive({
    required T failedValue,
  }) = ValueNotPositive<T>;
}
