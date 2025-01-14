import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'base_error.dart';
import 'base_response.dart';

Future<Either<BaseError, T?>> safeApiCall<T>(
    Future<BaseResponse<T>> Function() function,
    ) async {
  try {
    final res = await function.call();
    if (res.status == true) {
      return Right(res.data);
    }

    return Left(res.errors ?? const BaseError());
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout) {}

    if (e.type == DioExceptionType.sendTimeout) {}

    if (e.type == DioExceptionType.receiveTimeout) {}

    if (e.type == DioExceptionType.badCertificate) {}

    if (e.type == DioExceptionType.badResponse) {}

    if (e.type == DioExceptionType.cancel) {}

    if (e.type == DioExceptionType.connectionError) {}

    if (e.type == DioExceptionType.unknown) {}

    return Left(BaseError(message: e.toString()));
  } catch (e) {
    return Left(BaseError(message: e.toString()));
  }
}
