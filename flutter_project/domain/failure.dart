import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_file/failures.dart';
import 'core_failure.dart';
import 'repository_failure.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.appFile(AppFileFailure failure) = _AppFileFailure;

  const factory Failure.core(CoreFailure failure) = _CoreFailure;

  const factory Failure.repository(RepositoryFailure failure) = _RepositoryFailure;
}
