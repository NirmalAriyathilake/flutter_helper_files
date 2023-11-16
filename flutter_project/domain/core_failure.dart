import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_failure.freezed.dart';

/// Common failures
@freezed
class CoreFailure with _$CoreFailure {
  /// Unexpected Failure
  const factory CoreFailure.unexpected() = _Unexpected;
}
