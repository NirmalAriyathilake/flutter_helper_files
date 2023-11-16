import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_failure.freezed.dart';

@freezed
class RepositoryFailure with _$RepositoryFailure {
  /// Insuffieciant permission to execute operation
  const factory RepositoryFailure.insufficientPermissions() =
      _InsufficientPermissions;

  /// Unable to create db value
  const factory RepositoryFailure.unableToCreate() = _UnableToCreate;

  /// Unable to delete db value
  const factory RepositoryFailure.unableToDelete() = _UnableToDelete;

  /// Unable to find db value
  const factory RepositoryFailure.unableToFind() = _UnableToFind;

  /// Unable to update db value
  const factory RepositoryFailure.unableToUpdate() = _UnableToUpdate;
}
