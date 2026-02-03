import 'package:equatable/equatable.dart';

/// Generic API result wrapper
sealed class ApiResult<T> extends Equatable {
  const ApiResult();

  @override
  List<Object?> get props => [];
}

/// Success result with data
class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);

  @override
  List<Object?> get props => [data];
}

/// Failure result with error
class Failure<T> extends ApiResult<T> {
  final String message;
  final int? statusCode;
  final dynamic error;

  const Failure({required this.message, this.statusCode, this.error});

  @override
  List<Object?> get props => [message, statusCode, error];
}

/// Extension for easy result handling
extension ApiResultX<T> on ApiResult<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(String message, int? statusCode) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else {
      final fail = this as Failure<T>;
      return failure(fail.message, fail.statusCode);
    }
  }

  T? get dataOrNull => this is Success<T> ? (this as Success<T>).data : null;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;
}
